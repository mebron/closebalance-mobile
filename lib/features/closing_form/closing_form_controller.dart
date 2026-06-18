import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../core/providers.dart';
import '../../data/models/closing_status.dart';
import '../../data/models/editable/editable_closing.dart';
import '../../data/sync/editable_closing_mapper.dart';

const _uuid = Uuid();

// Sentinel value used by update methods to distinguish "caller passed null to
// clear the field" from "caller omitted the argument (leave unchanged)".
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

/// Identifies which closing the form edits.
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

  @override
  Future<EditableClosing> build() async {
    final arg = _arg;
    if (arg is _TodayArg) {
      return _loadOrCreateToday();
    } else if (arg is _ExistingArg) {
      return _loadExisting(arg);
    }
    throw StateError('Unknown ClosingFormArg: $arg');
  }

  Future<EditableClosing> _loadOrCreateToday() async {
    final branchId = ref.read(selectedBranchProvider);
    if (branchId == null) {
      throw StateError('No branch selected');
    }
    final today = _todayIso();
    final store = ref.read(editableClosingStoreProvider);

    // 1. Try local store first (local-first: avoids network on every open).
    final local = await store.load(branchId, today);
    if (local != null) {
      return local;
    }

    // 2. Try server — fetch today's closing if it already exists there.
    try {
      final api = ref.read(closingApiServiceProvider);
      final page = await api.list(dateFrom: today, dateTo: today, branchId: branchId);
      if (page.items.isNotEmpty) {
        final dc = await api.detail(page.items.first.id);
        final e = EditableClosingMapper.fromDailyClosing(dc, branchId: branchId);
        await store.save(e, dirty: false);
        return e;
      }
    } on Object {
      // offline — fall through to fresh draft
    }

    // 3. Fresh draft — the first save() call will sync it to the server.
    final draft = EditableClosing(
      branchId: branchId,
      date: today,
      status: ClosingStatus.draft,
    );
    await store.save(draft, dirty: false);
    return draft;
  }

  Future<EditableClosing> _loadExisting(_ExistingArg arg) async {
    // Always fetch fresh from server — stale cache would show outdated totals.
    try {
      final api = ref.read(closingApiServiceProvider);
      final dc = await api.detail(arg.serverId);
      final editable = EditableClosingMapper.fromDailyClosing(dc, branchId: arg.branchId);
      final store = ref.read(editableClosingStoreProvider);
      await store.save(editable, dirty: false);
      return editable;
    } on Object {
      // Offline — fall back to local cache.
      final store = ref.read(editableClosingStoreProvider);
      final cached = await store.load(arg.branchId, arg.date);
      if (cached != null && cached.serverId == arg.serverId) {
        return cached;
      }
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
    if (current == null || current.status.isFinalized) {
      return;
    }
    final oldDate = current.date;
    final updated = current.copyWith(date: date, headerDirty: true);
    state = AsyncData(updated);
    final store = ref.read(editableClosingStoreProvider);
    await store.delete(current.branchId, oldDate);
    await store.save(updated, dirty: true);
  }

  Future<void> setTotalSales(double totalSales) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    await _update(current.copyWith(totalSales: totalSales, headerDirty: true));
  }

  Future<void> setNotes(String? notes) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    await _update(current.copyWith(notes: notes, headerDirty: true));
  }

  // -------------------------------------------------------------------------
  // Sales
  // -------------------------------------------------------------------------

  Future<void> addSale({
    required int paymentChannelId,
    required double amount,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final sale = EditableSale(
      clientId: _uuid.v4(),
      paymentChannelId: paymentChannelId,
      amount: amount,
      dirty: true,
    );
    await _update(current.copyWith(sales: [...current.sales, sale]));
  }

  Future<void> updateSale({
    required String clientId,
    int? paymentChannelId,
    double? amount,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final sales = current.sales.map((s) {
      if (s.clientId != clientId) {
        return s;
      }
      return s.copyWith(
        paymentChannelId: paymentChannelId ?? s.paymentChannelId,
        amount: amount ?? s.amount,
        dirty: true,
      );
    }).toList();
    await _update(current.copyWith(sales: sales));
  }

  Future<void> deleteSale(String clientId) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final sales = current.sales.map((s) {
      if (s.clientId != clientId) {
        return s;
      }
      return s.copyWith(deleted: true, dirty: true);
    }).toList();
    await _update(current.copyWith(sales: sales));
  }

  // -------------------------------------------------------------------------
  // Expenses
  // -------------------------------------------------------------------------

  Future<void> addExpense({
    required int expenseCategoryId,
    String? description,
    required double amount,
    required String paymentMethod,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final expense = EditableExpense(
      clientId: _uuid.v4(),
      expenseCategoryId: expenseCategoryId,
      description: description,
      amount: amount,
      paymentMethod: paymentMethod,
      dirty: true,
    );
    await _update(current.copyWith(expenses: [...current.expenses, expense]));
  }

  Future<void> updateExpense({
    required String clientId,
    int? expenseCategoryId,
    Object? description = _kUnset,
    double? amount,
    String? paymentMethod,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final expenses = current.expenses.map((e) {
      if (e.clientId != clientId) {
        return e;
      }
      return e.copyWith(
        expenseCategoryId: expenseCategoryId ?? e.expenseCategoryId,
        description: identical(description, _kUnset) ? e.description : description as String?,
        amount: amount ?? e.amount,
        paymentMethod: paymentMethod ?? e.paymentMethod,
        dirty: true,
      );
    }).toList();
    await _update(current.copyWith(expenses: expenses));
  }

  Future<void> deleteExpense(String clientId) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final expenses = current.expenses.map((e) {
      if (e.clientId != clientId) {
        return e;
      }
      return e.copyWith(deleted: true, dirty: true);
    }).toList();
    await _update(current.copyWith(expenses: expenses));
  }

  // -------------------------------------------------------------------------
  // Deductions
  // -------------------------------------------------------------------------

  Future<void> addDeduction({
    required String type,
    String? description,
    required double amount,
    required String paymentMethod,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final deduction = EditableDeduction(
      clientId: _uuid.v4(),
      type: type,
      description: description,
      amount: amount,
      paymentMethod: paymentMethod,
      dirty: true,
    );
    await _update(current.copyWith(deductions: [...current.deductions, deduction]));
  }

  Future<void> updateDeduction({
    required String clientId,
    String? type,
    Object? description = _kUnset,
    double? amount,
    String? paymentMethod,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final deductions = current.deductions.map((d) {
      if (d.clientId != clientId) {
        return d;
      }
      return d.copyWith(
        type: type ?? d.type,
        description: identical(description, _kUnset) ? d.description : description as String?,
        amount: amount ?? d.amount,
        paymentMethod: paymentMethod ?? d.paymentMethod,
        dirty: true,
      );
    }).toList();
    await _update(current.copyWith(deductions: deductions));
  }

  Future<void> deleteDeduction(String clientId) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final deductions = current.deductions.map((d) {
      if (d.clientId != clientId) {
        return d;
      }
      return d.copyWith(deleted: true, dirty: true);
    }).toList();
    await _update(current.copyWith(deductions: deductions));
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
    if (current == null) {
      return;
    }
    final txn = EditableCounterTxn(
      clientId: _uuid.v4(),
      counterId: counterId,
      saleAmount: saleAmount,
      payments: payments,
      remarks: remarks,
      dirty: true,
    );
    await _update(
      current.copyWith(counterTransactions: [...current.counterTransactions, txn]),
    );
  }

  Future<void> updateCounterTxn({
    required String clientId,
    int? counterId,
    double? saleAmount,
    List<EditablePayment>? payments,
    Object? remarks = _kUnset,
  }) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final txns = current.counterTransactions.map((t) {
      if (t.clientId != clientId) {
        return t;
      }
      return t.copyWith(
        counterId: counterId ?? t.counterId,
        saleAmount: saleAmount ?? t.saleAmount,
        payments: payments ?? t.payments,
        remarks: identical(remarks, _kUnset) ? t.remarks : remarks as String?,
        dirty: true,
      );
    }).toList();
    await _update(current.copyWith(counterTransactions: txns));
  }

  Future<void> deleteCounterTxn(String clientId) async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final txns = current.counterTransactions.map((t) {
      if (t.clientId != clientId) {
        return t;
      }
      return t.copyWith(deleted: true, dirty: true);
    }).toList();
    await _update(current.copyWith(counterTransactions: txns));
  }

  // -------------------------------------------------------------------------
  // Save (sync to server)
  // -------------------------------------------------------------------------

  Future<void> save() async {
    final current = state.value;
    if (current == null) {
      return;
    }
    final syncService = ref.read(closingSyncServiceProvider);
    final fresh = await syncService.sync(current);
    final store = ref.read(editableClosingStoreProvider);
    await store.save(fresh, dirty: false);
    state = AsyncData(fresh);
  }

  Future<void> finalize() async {
    // Push any pending edits first so the server has the latest data.
    await save();
    final current = state.value;
    if (current == null) return;
    final serverId = current.serverId;
    if (serverId == null) throw StateError('Closing has no server ID after save');
    final api = ref.read(closingApiServiceProvider);
    final finalized = await api.finalize(serverId);
    final updated = EditableClosingMapper.fromDailyClosing(finalized, branchId: current.branchId);
    final store = ref.read(editableClosingStoreProvider);
    await store.save(updated, dirty: false);
    state = AsyncData(updated);
  }
}

final closingFormControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ClosingFormController, EditableClosing, ClosingFormArg>(
  ClosingFormController.new,
);
