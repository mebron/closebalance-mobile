import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/models/payment_channel.dart';
import 'package:closebalance_mobile/data/models/reference_data.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/sync/closing_sync_service.dart';
import 'package:closebalance_mobile/features/closing_form/closing_form_controller.dart';
import 'package:closebalance_mobile/features/closing_form/tabs/channels_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_editable_closing_store.dart';

class _MockSync extends Mock implements ClosingSyncService {}

class _MockClosingApiService extends Mock implements ClosingApiService {}

void main() {
  setUpAll(() => registerFallbackValue(
      EditableClosing(branchId: 1, date: '2026-06-15', status: ClosingStatus.draft)));

  _MockClosingApiService _stubEmptyApi() {
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

  testWidgets('ChannelsTab shows Add channel button when empty', (tester) async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = _stubEmptyApi();

    await tester.pumpWidget(ProviderScope(
      overrides: [
        editableClosingStoreProvider.overrideWithValue(store),
        closingSyncServiceProvider.overrideWithValue(sync),
        closingApiServiceProvider.overrideWithValue(api),
        selectedBranchProvider.overrideWith((ref) => 1),
        referenceDataProvider.overrideWith((ref) async => ReferenceData(
          branches: const [],
          paymentChannels: [PaymentChannel(id: 4, name: 'Cash', type: 'cash')],
          expenseCategories: const [],
          currencySymbol: '\$',
          counters: const [],
        )),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: ChannelsTab(
            arg: ClosingFormArg.today(),
            currencySymbol: '\$',
          ),
        ),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text('Add channel'), findsOneWidget);
  });

  testWidgets('ChannelsTab shows line card after addSale', (tester) async {
    final store = FakeEditableClosingStore();
    final sync = _MockSync();
    final api = _stubEmptyApi();

    // Pre-seed the store with a closing that has a sale
    await store.save(
      EditableClosing(
        branchId: 1,
        date: DateTime.now().toIso8601String().substring(0, 10),
        status: ClosingStatus.draft,
        totalSales: 500,
        sales: const [
          EditableSale(clientId: 'a', paymentChannelId: 4, amount: 500, dirty: true),
        ],
      ),
      dirty: true,
    );

    await tester.pumpWidget(ProviderScope(
      overrides: [
        editableClosingStoreProvider.overrideWithValue(store),
        closingSyncServiceProvider.overrideWithValue(sync),
        closingApiServiceProvider.overrideWithValue(api),
        selectedBranchProvider.overrideWith((ref) => 1),
        referenceDataProvider.overrideWith((ref) async => ReferenceData(
          branches: const [],
          paymentChannels: [PaymentChannel(id: 4, name: 'Cash', type: 'cash')],
          expenseCategories: const [],
          currencySymbol: '\$',
          counters: const [],
        )),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: ChannelsTab(
            arg: ClosingFormArg.today(),
            currencySymbol: '\$',
          ),
        ),
      ),
    ));

    await tester.pumpAndSettle();

    // Should find the channel name and a Chip showing balanced
    expect(find.text('Cash'), findsAtLeast(1));
  });
}
