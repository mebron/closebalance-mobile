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

class _MockSync extends Mock implements ClosingSyncService {}

class _MockClosingApiService extends Mock implements ClosingApiService {}

void main() {
  setUpAll(() => registerFallbackValue(EditableClosing(
      branchId: 1, date: '2026-06-15', status: ClosingStatus.draft)));

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
}
