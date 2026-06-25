import 'dart:async';

import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/sync/closing_sync_service.dart';
import 'package:closebalance_mobile/features/closing_form/closing_form_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_editable_closing_store.dart';

class _MockSync extends Mock implements ClosingSyncService {}

class _MockClosingApiService extends Mock implements ClosingApiService {}

void main() {
  setUpAll(() => registerFallbackValue(
      EditableClosing(branchId: 1, date: '2026-06-15', status: ClosingStatus.draft)));

  test('loads-or-creates today, addSale marks dirty and persists', () async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = _MockClosingApiService();
    when(() => api.list(
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          branchId: any(named: 'branchId'),
        )).thenAnswer((_) async => Paginated(
          items: [],
          meta: PageMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 0),
        ));
    final c = ProviderContainer(overrides: [
      editableClosingStoreProvider.overrideWithValue(store),
      closingSyncServiceProvider.overrideWithValue(sync),
      closingApiServiceProvider.overrideWithValue(api),
      selectedBranchProvider.overrideWith((ref) => 1),
    ]);
    addTearDown(c.dispose);

    final ctrl = c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    await ctrl.addSale(paymentChannelId: 4, amount: 500);

    final state = c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.sales.single.amount, 500);
    expect(state.sales.single.dirty, isTrue);
    // persisted dirty
    final saved = await store.load(1, state.date);
    expect(saved!.sales.single.amount, 500);
  });

  test('background refresh does not overwrite state when user has unsaved edits', () async {
    // Background refresh only runs on the TODAY path (_loadOrCreateToday).
    final now = DateTime.now();
    final today =
        '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    // Arrange: cache has a server-confirmed closing (serverId=6, no expenses).
    final store = FakeEditableClosingStore();
    await store.save(
      EditableClosing(serverId: 6, branchId: 1, date: today, status: ClosingStatus.draft),
      dirty: false,
    );

    final detailCompleter = Completer<DailyClosing>();
    final api = _MockClosingApiService();
    // detail() hangs until we resolve it — simulates slow network.
    when(() => api.detail(6)).thenAnswer((_) => detailCompleter.future);

    final sync = _MockSync();
    final c = ProviderContainer(overrides: [
      editableClosingStoreProvider.overrideWithValue(store),
      closingSyncServiceProvider.overrideWithValue(sync),
      closingApiServiceProvider.overrideWithValue(api),
      selectedBranchProvider.overrideWith((ref) => 1),
    ]);
    addTearDown(c.dispose);

    // Load: cache returned immediately, background refresh in-flight.
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    // While refresh is in-flight, user adds an expense.
    final ctrl = c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await ctrl.addExpense(expenseCategoryId: 4, amount: 5500, paymentChannelId: 1);

    // Background refresh resolves with STALE data (no expense yet).
    detailCompleter.complete(DailyClosing(id: 6, date: today, status: ClosingStatus.draft));
    await Future.microtask(() {});

    // State must still contain the locally added expense.
    final state = c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.expenses.where((e) => !e.deleted), hasLength(1),
        reason: 'background refresh must not erase unsaved local edits');
  });

  test('background refresh does not overwrite state when fresh data is stale '
      '(raced with a save that added server-confirmed items)', () async {
    // Background refresh only runs on the TODAY path (_loadOrCreateToday).
    final now = DateTime.now();
    final today =
        '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    // Arrange: cache has a server-confirmed closing with E14 already synced.
    final store = FakeEditableClosingStore();
    await store.save(
      EditableClosing(
        serverId: 6,
        branchId: 1,
        date: today,
        status: ClosingStatus.draft,
        expenses: [
          EditableExpense(
              clientId: 'c1',
              serverId: 14,
              expenseCategoryId: 4,
              amount: 5500,
              paymentChannelId: 1),
        ],
      ),
      dirty: false,
    );

    final detailCompleter = Completer<DailyClosing>();
    final api = _MockClosingApiService();
    when(() => api.detail(6)).thenAnswer((_) => detailCompleter.future);

    final sync = _MockSync();
    final c = ProviderContainer(overrides: [
      editableClosingStoreProvider.overrideWithValue(store),
      closingSyncServiceProvider.overrideWithValue(sync),
      closingApiServiceProvider.overrideWithValue(api),
      selectedBranchProvider.overrideWith((ref) => 1),
    ]);
    addTearDown(c.dispose);

    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    // Background refresh returns data MISSING E14 — a stale snapshot taken
    // before a concurrent save registered the new expense on the server.
    detailCompleter.complete(DailyClosing(id: 6, date: today, status: ClosingStatus.draft));
    await Future.microtask(() {});

    final state = c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.expenses.where((e) => !e.deleted), hasLength(1),
        reason: 'stale background refresh must not drop server-confirmed items');
  });

  test('finalize saves first then calls API and marks state finalized', () async {
    const today = '2026-06-15';
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = _MockClosingApiService();

    when(() => api.list(
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          branchId: any(named: 'branchId'),
        )).thenAnswer((_) async => Paginated(
          items: [],
          meta: PageMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 0),
        ));

    // sync returns a closing with serverId set (simulates successful push)
    when(() => sync.sync(any())).thenAnswer((_) async => EditableClosing(
          serverId: 9,
          branchId: 1,
          date: today,
          status: ClosingStatus.draft,
        ));

    when(() => api.finalize(9)).thenAnswer((_) async => const DailyClosing(
          id: 9,
          date: today,
          status: ClosingStatus.finalized,
        ));

    final c = ProviderContainer(overrides: [
      editableClosingStoreProvider.overrideWithValue(store),
      closingSyncServiceProvider.overrideWithValue(sync),
      closingApiServiceProvider.overrideWithValue(api),
      selectedBranchProvider.overrideWith((ref) => 1),
    ]);
    addTearDown(c.dispose);

    final ctrl = c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    await ctrl.finalize();

    final result = c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(result.status, ClosingStatus.finalized);
    expect(result.serverId, 9);
    verify(() => sync.sync(any())).called(1);
    verify(() => api.finalize(9)).called(1);
  });
}
