import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/branch.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/expense_category.dart';
import 'package:closebalance_mobile/data/models/reference_data.dart';
import 'package:closebalance_mobile/data/repos/closing_repository.dart';
import 'package:closebalance_mobile/data/repos/reference_repository.dart';
import 'package:closebalance_mobile/features/expenses/quick_expense_screen.dart';
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
          paymentChannels: const [],
          expenseCategories: const [ExpenseCategory(id: 7, name: 'Rent')],
          currencySymbol: '₹',
        ));
  });

  Widget app() => ProviderScope(
        overrides: [
          referenceRepositoryProvider.overrideWithValue(refRepo),
          closingRepositoryProvider.overrideWithValue(closingRepo),
          selectedBranchProvider.overrideWith((ref) => 1),
        ],
        child: const MaterialApp(home: QuickExpenseScreen()),
      );

  testWidgets('validates amount before saving', (tester) async {
    await tester.pumpWidget(app());
    await tester.pump();
    await tester.tap(find.text('Save Expense'));
    await tester.pump();
    expect(find.text('Enter an amount'), findsOneWidget);
  });

  testWidgets('submits expense with category, note and method', (tester) async {
    when(() => closingRepo.addExpense(
              branchId: 1,
              today: any(named: 'today'),
              expenseCategoryId: 7,
              description: 'Rent',
              amount: 300,
              paymentMethod: 'cash'))
        .thenAnswer((_) async => DailyClosing.fromJson(
            {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 0.0}));

    await tester.pumpWidget(app());
    await tester.pump();
    await tester.enterText(find.byType(TextField).first, '300');
    await tester.tap(find.byType(DropdownButtonFormField<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rent').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'What was it for?'), 'Rent');
    await tester.tap(find.text('Save Expense'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    verify(() => closingRepo.addExpense(
          branchId: 1,
          today: any(named: 'today'),
          expenseCategoryId: 7,
          description: 'Rent',
          amount: 300,
          paymentMethod: 'cash')).called(1);
  });
}
