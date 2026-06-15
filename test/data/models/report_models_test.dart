import 'package:closebalance_mobile/data/models/report_rows.dart';
import 'package:closebalance_mobile/data/models/report_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ReportSummary parses the flat shape', () {
    final s = ReportSummary.fromJson({
      'date': '2026-06-14',
      'total_sales': 25000.0,
      'cash_in_hand': 8500.0,
      'draft_closings': 2,
      'finalized_closings': 3,
      'total_expenses': 1200.0,
      'net_position': 23800.0,
    });
    expect(s.totalSales, 25000.0);
    expect(s.cashInHand, 8500.0);
    expect(s.draftClosings, 2);
    expect(s.finalizedClosings, 3);
  });

  test('ExpenseCategoryTotal parses', () {
    final e = ExpenseCategoryTotal.fromJson(
        {'category': 'Rent', 'total': 300.0, 'count': 2});
    expect(e.category, 'Rent');
    expect(e.total, 300.0);
    expect(e.count, 2);
  });

  test('CounterBalanceRow parses', () {
    final c = CounterBalanceRow.fromJson(
        {'counter': 'C1', 'sale_amount': 500.0, 'paid_amount': 150.0, 'balance': 350.0});
    expect(c.balance, 350.0);
  });
}
