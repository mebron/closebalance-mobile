import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/expense_line.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/models/sale_line.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/remote/closings_api.dart';
import 'package:closebalance_mobile/data/remote/expenses_api.dart';
import 'package:closebalance_mobile/data/remote/sales_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockClosings extends Mock implements ClosingsApi {}

class _MockSales extends Mock implements SalesApi {}

class _MockExpenses extends Mock implements ExpensesApi {}

DailyClosing _closing({int id = 9, double total = 0}) => DailyClosing.fromJson({
      'id': id, 'date': '2026-06-14', 'status': 'draft', 'total_sales': total,
      'branch': {'id': 1, 'name': 'Main'},
    });

Paginated<DailyClosing> _page(List<DailyClosing> items) => Paginated(
      items: items,
      meta: PageMeta.fromJson({'current_page': 1, 'last_page': 1, 'per_page': 15, 'total': items.length}),
    );

void main() {
  late _MockClosings closings;
  late _MockSales sales;
  late _MockExpenses expenses;
  late ClosingApiService svc;

  setUp(() {
    closings = _MockClosings();
    sales = _MockSales();
    expenses = _MockExpenses();
    svc = ClosingApiService(closings, sales, expenses);
  });

  test('ensureTodayClosing returns existing when present', () async {
    when(() => closings.index(dateFrom: any(named: 'dateFrom'), dateTo: any(named: 'dateTo'),
        branchId: any(named: 'branchId'))).thenAnswer((_) async => _page([_closing(id: 5)]));
    when(() => closings.show(5)).thenAnswer((_) async => _closing(id: 5));
    final c = await svc.ensureTodayClosing(branchId: 1, today: '2026-06-14');
    expect(c.id, 5);
  });

  test('ensureTodayClosing creates when none', () async {
    when(() => closings.index(dateFrom: any(named: 'dateFrom'), dateTo: any(named: 'dateTo'),
        branchId: any(named: 'branchId'))).thenAnswer((_) async => _page(const []));
    when(() => closings.store(branchId: 1, date: '2026-06-14', totalSales: 0))
        .thenAnswer((_) async => _closing(id: 9));
    final c = await svc.ensureTodayClosing(branchId: 1, today: '2026-06-14');
    expect(c.id, 9);
  });

  test('addSaleOnline creates a line and bumps total_sales', () async {
    when(() => closings.index(dateFrom: any(named: 'dateFrom'), dateTo: any(named: 'dateTo'),
        branchId: any(named: 'branchId'))).thenAnswer((_) async => _page(const []));
    when(() => closings.store(branchId: 1, date: '2026-06-14', totalSales: 0))
        .thenAnswer((_) async => _closing(id: 9, total: 0));
    when(() => sales.create(closingId: 9, paymentChannelId: 4, amount: 2000))
        .thenAnswer((_) async => const SaleLine(id: 1, paymentChannelId: 4, amount: 2000));
    when(() => closings.update(9, totalSales: 2000))
        .thenAnswer((_) async => _closing(id: 9, total: 2000));

    final c = await svc.addSaleOnline(
        branchId: 1, today: '2026-06-14', paymentChannelId: 4, amount: 2000);
    expect(c.totalSales, 2000.0);
    verify(() => closings.update(9, totalSales: 2000)).called(1);
  });

  test('addExpenseOnline creates an expense and re-shows', () async {
    when(() => closings.index(dateFrom: any(named: 'dateFrom'), dateTo: any(named: 'dateTo'),
        branchId: any(named: 'branchId'))).thenAnswer((_) async => _page(const []));
    when(() => closings.store(branchId: 1, date: '2026-06-14', totalSales: 0))
        .thenAnswer((_) async => _closing(id: 9));
    when(() => expenses.create(closingId: 9, expenseCategoryId: 7, description: 'Rent',
        amount: 300, paymentMethod: 'cash', remarks: null)).thenAnswer((_) async =>
        const ExpenseLine(id: 1, expenseCategoryId: 7, description: 'Rent', amount: 300, paymentMethod: 'cash'));
    when(() => closings.show(9)).thenAnswer((_) async => _closing(id: 9));

    final c = await svc.addExpenseOnline(branchId: 1, today: '2026-06-14',
        expenseCategoryId: 7, description: 'Rent', amount: 300, paymentMethod: 'cash');
    expect(c.id, 9);
  });
}
