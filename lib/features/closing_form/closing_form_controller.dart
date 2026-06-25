import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/providers.dart';
import '../../data/models/closing_status.dart';
import '../../data/models/editable/editable_closing.dart';
import '../../data/sync/editable_closing_mapper.dart';

const _uuid = Uuid();
const _kUnset = Object();

String _todayIso() {
  final n = DateTime.now();
  return '${n.year.toString().padLeft(4, '0')}-'
      '${n.month.toString().padLeft(2, '0')}-'
      '${n.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// Arg
// ---------------------------------------------------------------------------

sealed class ClosingFormArg {
  const ClosingFormArg();
  const factory ClosingFormArg.today() = _TodayArg;
  const factory ClosingFormArg.existing({
    required int serverId,
    required int branchId,
    required String date,
  }) = _ExistingArg;
}

final class _TodayArg extends ClosingFormArg {
  const _TodayArg();
  @override
  bool operator ==(Object other) => other is _TodayArg;
  @override
  int get hashCode => 0;
}

final class _ExistingArg extends ClosingFormArg {
  const _ExistingArg({
    required this.serverId,
    required this.branchId,
    required this.date,
  });
  final int serverId;
  final int branchId;
  final String date;
  @override
  bool operator ==(Object other) =>
      other is _ExistingArg &&
      other.serverId == serverId &&
      other.branchId == branchId &&
      other.date == date;
  @override
  int get hashCode => Object.hash(serverId, branchId, date);
}

// ---------------------------------------------------------------------------
// Controller
// ---------------------------------------------------------------------------

class ClosingFormController extends AsyncNotifier<EditableClosing> {
  ClosingFormController(this._arg);

  final ClosingFormArg _arg;

  /// Guards save() and finalize() against concurrent calls.
  bool _syncing = false;

  @override
  Future<EditableClosing> build() async {
    final arg = _arg;
    if (arg is _TodayArg) return _loadOrCreateToday();
    if (arg is _ExistingArg) return _loadExisting(arg);
    throw StateError('Unknown ClosingFormArg: $arg');
  }

  // -------------------------------------------------------------------------
  // Loading
  // -------------------------------------------------------------------------

  Future<EditableClosing> _loadOrCreateToday() async {
    final branchId = ref.read(selectedBranchProvider);
    if (branchId == null) throw StateError('No branch selected');

    final today = _todayIso();
    final store = ref.read(editableClosingStoreProvider);
    final (:closing, :dirty) = await store.loadWithMeta(branchId, today);

    // Unsaved edits: return immediately — never overwrite in-progress work.
    if (dirty && closing != null) return closing;

    // Has a known server record: return cached instantly and refresh behind
    // the scenes so web-panel changes (new expenses, sales, etc.) appear
    // without blocking the UI.
    if (closing?.serverId != null) {
      unawaited(_refreshTodayInBackground(closing!.serverId!, branchId, today));
      return closing;
    }

    // No local or no server ID yet — must reach the network first.
    return _fetchOrCreateToday(branchId, today, fallback: closing);
  }

  Future<void> _refreshTodayInBackground(
      int serverId, int branchId, String date) async {
    try {
      final api = ref.read(closingApiServiceProvider);
      final dc = await api.detail(serverId);
      final fresh = EditableClosingMapper.fromDailyClosing(dc, branchId: branchId);
      // Discard if the user made edits while the network call was in-flight, or
      // if the response is stale (fetched before a concurrent save completed).
      final current = state.value;
      if (current != null &&
          (_hasLocalEdits(current) || _isFreshDataStale(current, fresh))) {
        return;
      }
      final store = ref.read(editableClosingStoreProvider);
      await store.save(fresh, dirty: false);
      state = AsyncData(fresh);
    } catch (_) {
      // Network error or provider disposed — the cached data is still valid.
    }
  }

  bool _hasLocalEdits(EditableClosing c) =>
      c.headerDirty ||
      c.expenses.any((e) => e.dirty || e.deleted) ||
      c.sales.any((s) => s.dirty || s.deleted) ||
      c.deductions.any((d) => d.dirty || d.deleted) ||
      c.counterTransactions.any((t) => t.dirty || t.deleted);

  /// Returns true when [fresh] is missing server-confirmed IDs from [current],
  /// indicating the background fetch raced with a concurrent save.
  bool _isFreshDataStale(EditableClosing current, EditableClosing fresh) {
    Set<int> ids<T>(Iterable<T> items, int? Function(T) id, bool Function(T) del) =>
        {for (final e in items) if (id(e) != null && !del(e)) id(e)!};

    return !ids(fresh.expenses, (e) => e.serverId, (e) => e.deleted)
            .containsAll(ids(current.expenses, (e) => e.serverId, (e) => e.deleted)) ||
        !ids(fresh.sales, (e) => e.serverId, (e) => e.deleted)
            .containsAll(ids(current.sales, (e) => e.serverId, (e) => e.deleted)) ||
        !ids(fresh.deductions, (e) => e.serverId, (e) => e.deleted)
            .containsAll(ids(current.deductions, (e) => e.serverId, (e) => e.deleted)) ||
        !ids(fresh.counterTransactions, (e) => e.serverId, (e) => e.deleted)
            .containsAll(ids(current.counterTransactions, (e) => e.serverId, (e) => e.deleted));
  }

  Future<EditableClosing> _fetchOrCreateToday(int branchId, String today,
      {EditableClosing? fallback}) async {
    try {
      final api = ref.read(closingApiServiceProvider);
      final page =
          await api.list(dateFrom: today, dateTo: today, branchId: branchId);
      if (page.items.isNotEmpty) {
        final dc = await api.detail(page.items.first.id);
        final e = EditableClosingMapper.fromDailyClosing(dc, branchId: branchId);
        await ref.read(editableClosingStoreProvider).save(e, dirty: false);
        return e;
      }
      if (fallback != null) return fallback;
    } on Object {
      if (fallback != null) return fallback;
    }
    final draft = EditableClosing(
        branchId: branchId, date: today, status: ClosingStatus.draft);
    await ref.read(editableClosingStoreProvider).save(draft, dirty: false);
    return draft;
  }

  Future<EditableClosing> _loadExisting(_ExistingArg arg) async {
    // Always fetch fresh — stale cache would show outdated totals.
    try {
      final api = ref.read(closingApiServiceProvider);
      final dc = await api.detail(arg.serverId);
      final editable =
          EditableClosingMapper.fromDailyClosing(dc, branchId: arg.branchId);
      await ref.read(editableClosingStoreProvider).save(editable, dirty: false);
      return editable;
    } on Object {
      final cached = await ref
          .read(editableClosingStoreProvider)
          .load(arg.branchId, arg.date);
      if (cached != null && cached.serverId == arg.serverId) return cached;
      rethrow;
    }
  }

  // -------------------------------------------------------------------------
  // Mutation helpers
  // -------------------------------------------------------------------------

  bool get _isToday => _arg is _TodayArg;

  Future<void> _update(EditableClosing next) async {
    state = AsyncData(next);
    if (_isToday) {
      await ref.read(editableClosingStoreProvider).save(next, dirty: true);
    }
  }

  // -------------------------------------------------------------------------
  // Header
  // -------------------------------------------------------------------------

  Future<void> setDate(String date) async {
    final current = state.value;
    if (current == null || current.status.isFinalized) return;
    final oldDate = current.date;
    final updated = current.copyWith(date: date, headerDirty: true);
    state = AsyncData(updated);
    final store = ref.read(editableClosingStoreProvider);
    await store.delete(current.branchId, oldDate);
    await store.save(updated, dirty: true);
  }

  Future<void> setTotalSales(double totalSales) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(totalSales: totalSales, headerDirty: true));
  }

  Future<void> setNotes(String? notes) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(notes: notes, headerDirty: true));
  }

  // -------------------------------------------------------------------------
  // Sales
  // -------------------------------------------------------------------------

  Future<void> addSale({required int paymentChannelId, required double amount}) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(sales: [
      ...current.sales,
      EditableSale(
          clientId: _uuid.v4(),
          paymentChannelId: paymentChannelId,
          amount: amount,
          dirty: true),
    ]));
  }

  Future<void> updateSale(
      {required String clientId, int? paymentChannelId, double? amount}) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        sales: current.sales.map((s) => s.clientId != clientId
            ? s
            : s.copyWith(
                paymentChannelId: paymentChannelId ?? s.paymentChannelId,
                amount: amount ?? s.amount,
                dirty: true)).toList()));
  }

  Future<void> deleteSale(String clientId) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        sales: current.sales.map((s) => s.clientId != clientId
            ? s
            : s.copyWith(deleted: true, dirty: true)).toList()));
  }

  // -------------------------------------------------------------------------
  // Expenses
  // -------------------------------------------------------------------------

  Future<void> addExpense({
    required int expenseCategoryId,
    String? description,
    required double amount,
    required int paymentChannelId,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(expenses: [
      ...current.expenses,
      EditableExpense(
          clientId: _uuid.v4(),
          expenseCategoryId: expenseCategoryId,
          description: description,
          amount: amount,
          paymentChannelId: paymentChannelId,
          dirty: true),
    ]));
  }

  Future<void> updateExpense({
    required String clientId,
    int? expenseCategoryId,
    Object? description = _kUnset,
    double? amount,
    int? paymentChannelId,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        expenses: current.expenses.map((e) => e.clientId != clientId
            ? e
            : e.copyWith(
                expenseCategoryId: expenseCategoryId ?? e.expenseCategoryId,
                description: identical(description, _kUnset)
                    ? e.description
                    : description as String?,
                amount: amount ?? e.amount,
                paymentChannelId: paymentChannelId ?? e.paymentChannelId,
                dirty: true)).toList()));
  }

  Future<void> deleteExpense(String clientId) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        expenses: current.expenses.map((e) => e.clientId != clientId
            ? e
            : e.copyWith(deleted: true, dirty: true)).toList()));
  }

  // -------------------------------------------------------------------------
  // Deductions
  // -------------------------------------------------------------------------

  Future<void> addDeduction({
    required String type,
    String? description,
    required double amount,
    required int paymentChannelId,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(deductions: [
      ...current.deductions,
      EditableDeduction(
          clientId: _uuid.v4(),
          type: type,
          description: description,
          amount: amount,
          paymentChannelId: paymentChannelId,
          dirty: true),
    ]));
  }

  Future<void> updateDeduction({
    required String clientId,
    String? type,
    Object? description = _kUnset,
    double? amount,
    int? paymentChannelId,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        deductions: current.deductions.map((d) => d.clientId != clientId
            ? d
            : d.copyWith(
                type: type ?? d.type,
                description: identical(description, _kUnset)
                    ? d.description
                    : description as String?,
                amount: amount ?? d.amount,
                paymentChannelId: paymentChannelId ?? d.paymentChannelId,
                dirty: true)).toList()));
  }

  Future<void> deleteDeduction(String clientId) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        deductions: current.deductions.map((d) => d.clientId != clientId
            ? d
            : d.copyWith(deleted: true, dirty: true)).toList()));
  }

  // -------------------------------------------------------------------------
  // Counter Transactions
  // -------------------------------------------------------------------------

  Future<void> addCounterTxn({
    required int counterId,
    required double saleAmount,
    required List<EditablePayment> payments,
    String? remarks,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(counterTransactions: [
      ...current.counterTransactions,
      EditableCounterTxn(
          clientId: _uuid.v4(),
          counterId: counterId,
          saleAmount: saleAmount,
          payments: payments,
          remarks: remarks,
          dirty: true),
    ]));
  }

  Future<void> updateCounterTxn({
    required String clientId,
    int? counterId,
    double? saleAmount,
    List<EditablePayment>? payments,
    Object? remarks = _kUnset,
  }) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        counterTransactions: current.counterTransactions.map((t) => t.clientId != clientId
            ? t
            : t.copyWith(
                counterId: counterId ?? t.counterId,
                saleAmount: saleAmount ?? t.saleAmount,
                payments: payments ?? t.payments,
                remarks: identical(remarks, _kUnset)
                    ? t.remarks
                    : remarks as String?,
                dirty: true)).toList()));
  }

  Future<void> deleteCounterTxn(String clientId) async {
    final current = state.value;
    if (current == null) return;
    await _update(current.copyWith(
        counterTransactions: current.counterTransactions.map((t) => t.clientId != clientId
            ? t
            : t.copyWith(deleted: true, dirty: true)).toList()));
  }

  // -------------------------------------------------------------------------
  // Save / Finalize
  // -------------------------------------------------------------------------

  Future<void> _syncNow() async {
    final current = state.value;
    if (current == null) return;
    final fresh = await ref.read(closingSyncServiceProvider).sync(current);
    await ref.read(editableClosingStoreProvider).save(fresh, dirty: false);
    state = AsyncData(fresh);
  }

  Future<void> save() async {
    if (_syncing) return;
    _syncing = true;
    try {
      await _syncNow();
    } finally {
      _syncing = false;
    }
  }

  Future<void> finalize() async {
    if (_syncing) return;
    _syncing = true;
    try {
      await _syncNow();
      final current = state.value;
      if (current == null) return;
      final serverId = current.serverId;
      if (serverId == null) throw StateError('Closing has no server ID after save');
      final finalized = await ref.read(closingApiServiceProvider).finalize(serverId);
      final updated = EditableClosingMapper.fromDailyClosing(finalized,
          branchId: current.branchId);
      await ref.read(editableClosingStoreProvider).save(updated, dirty: false);
      state = AsyncData(updated);
    } finally {
      _syncing = false;
    }
  }
}

final closingFormControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ClosingFormController, EditableClosing, ClosingFormArg>(
  ClosingFormController.new,
);
