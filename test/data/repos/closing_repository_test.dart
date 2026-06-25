// The old ClosingRepository/SyncService/PendingMutation architecture was
// replaced with ClosingFormController + ClosingSyncService.  This file now
// tests the expense and deduction mutations on ClosingFormController, which
// complement the sale-focused test in closing_form_controller_test.dart.

import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/sync/closing_sync_service.dart';
import 'package:closebalance_mobile/features/closing_form/closing_form_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_editable_closing_store.dart';
import '../../support/fixed_branch_notifier.dart';

class _MockSync extends Mock implements ClosingSyncService {}

class _MockClosingApiService extends Mock implements ClosingApiService {}

ProviderContainer _container(
    FakeEditableClosingStore store, _MockSync sync, _MockClosingApiService api) {
  final c = ProviderContainer(overrides: [
    editableClosingStoreProvider.overrideWithValue(store),
    closingSyncServiceProvider.overrideWithValue(sync),
    closingApiServiceProvider.overrideWithValue(api),
    selectedBranchProvider.overrideWith(() => FixedBranchNotifier(1)),
  ]);
  addTearDown(c.dispose);
  return c;
}

void main() {
  setUpAll(() => registerFallbackValue(
      EditableClosing(branchId: 1, date: '2026-06-15', status: ClosingStatus.draft)));

  _MockClosingApiService stubEmptyApi() {
    final api = _MockClosingApiService();
    when(() => api.list(
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          branchId: any(named: 'branchId'),
        )).thenAnswer((_) async => Paginated(
          items: [],
          meta: PageMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 0),
        ));
    return api;
  }

  test('addExpense marks dirty and persists to store', () async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = stubEmptyApi();
    final c = _container(store, sync, api);

    final ctrl =
        c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    await ctrl.addExpense(
      expenseCategoryId: 7,
      description: 'Rent',
      amount: 300,
      paymentChannelId: 1,
    );

    final state =
        c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.expenses.single.amount, 300);
    expect(state.expenses.single.expenseCategoryId, 7);
    expect(state.expenses.single.dirty, isTrue);

    final saved = await store.load(1, state.date);
    expect(saved!.expenses.single.amount, 300);
  });

  test('deleteExpense marks the entry as deleted', () async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = stubEmptyApi();
    final c = _container(store, sync, api);

    final ctrl =
        c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    await ctrl.addExpense(
      expenseCategoryId: 3,
      amount: 100,
      paymentChannelId: 1,
    );

    final clientId = c
        .read(closingFormControllerProvider(const ClosingFormArg.today()))
        .value!
        .expenses
        .single
        .clientId;

    await ctrl.deleteExpense(clientId);

    final state =
        c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.expenses.single.deleted, isTrue);
  });

  test('addDeduction marks dirty and persists to store', () async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = stubEmptyApi();
    final c = _container(store, sync, api);

    final ctrl =
        c.read(closingFormControllerProvider(const ClosingFormArg.today()).notifier);
    await c.read(closingFormControllerProvider(const ClosingFormArg.today()).future);

    await ctrl.addDeduction(
      type: 'discount',
      description: 'Staff discount',
      amount: 50,
      paymentChannelId: 1,
    );

    final state =
        c.read(closingFormControllerProvider(const ClosingFormArg.today())).value!;
    expect(state.deductions.single.amount, 50);
    expect(state.deductions.single.type, 'discount');
    expect(state.deductions.single.dirty, isTrue);
  });
}
