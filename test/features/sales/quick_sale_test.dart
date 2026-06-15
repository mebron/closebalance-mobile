import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/branch.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/payment_channel.dart';
import 'package:closebalance_mobile/data/models/reference_data.dart';
import 'package:closebalance_mobile/data/repos/closing_repository.dart';
import 'package:closebalance_mobile/data/repos/reference_repository.dart';
import 'package:closebalance_mobile/features/sales/quick_sale_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockClosingRepo extends Mock implements ClosingRepository {}

class _MockReferenceRepo extends Mock implements ReferenceRepository {}

void main() {
  late _MockClosingRepo closingRepo;
  late _MockReferenceRepo refRepo;

  setUp(() {
    closingRepo = _MockClosingRepo();
    refRepo = _MockReferenceRepo();
    when(() => refRepo.cached()).thenAnswer((_) async => ReferenceData(
          branches: const [Branch(id: 1, name: 'Main')],
          paymentChannels: const [PaymentChannel(id: 4, name: 'Cash', type: 'cash')],
          expenseCategories: const [],
          currencySymbol: '₹',
        ));
  });

  Widget app() => ProviderScope(
        overrides: [
          referenceRepositoryProvider.overrideWithValue(refRepo),
          closingRepositoryProvider.overrideWithValue(closingRepo),
          selectedBranchProvider.overrideWith((ref) => 1),
        ],
        child: const MaterialApp(home: QuickSaleScreen()),
      );

  testWidgets('submits a sale for the chosen channel and amount', (tester) async {
    when(() => closingRepo.addSale(
          branchId: 1,
          today: any(named: 'today'),
          paymentChannelId: 4,
          amount: 500)).thenAnswer((_) async => DailyClosing.fromJson(
        {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 500.0}));

    await tester.pumpWidget(app());
    await tester.pump();

    await tester.enterText(find.byType(TextField), '500');
    await tester.tap(find.text('Cash'));
    await tester.pump();
    await tester.tap(find.text('Save Sale'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    verify(() => closingRepo.addSale(
        branchId: 1,
        today: any(named: 'today'),
        paymentChannelId: 4,
        amount: 500)).called(1);
  });

  testWidgets('shows an error when no amount entered', (tester) async {
    await tester.pumpWidget(app());
    await tester.pump();
    await tester.tap(find.text('Save Sale'));
    await tester.pump();
    expect(find.text('Enter an amount'), findsOneWidget);
  });
}
