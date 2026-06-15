import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses the lean list shape with computed defaults', () {
    final c = DailyClosing.fromJson({
      'id': 1,
      'date': '2026-06-14',
      'status': 'draft',
      'total_sales': 5000.0,
      'branch': {'id': 2, 'name': 'Main'},
      'created_at': '2026-06-14T08:00:00+00:00',
    });

    expect(c.id, 1);
    expect(c.status, ClosingStatus.draft);
    expect(c.statusIsFinalized, isFalse);
    expect(c.totalSales, 5000.0);
    expect(c.branch?.name, 'Main');
    expect(c.cashInHand, 0.0);
    expect(c.sales, isEmpty);
  });

  test('parses the full detail shape', () {
    final c = DailyClosing.fromJson({
      'id': 1,
      'date': '2026-06-14',
      'status': 'finalized',
      'notes': 'ok',
      'branch': {'id': 2, 'name': 'Main'},
      'total_sales': 5000.0,
      'total_expenses': 300.0,
      'total_deductions': 100.0,
      'cash_collections': 2000.0,
      'online_collections': 2500.0,
      'aggregator_collections': 500.0,
      'total_counter_paid': 150.0,
      'cash_in_hand': 1550.0,
      'net_position': 4600.0,
      'sales': [
        {'id': 1, 'payment_channel_id': 4,
         'payment_channel': {'id': 4, 'name': 'Cash', 'type': 'cash'}, 'amount': 2000.0},
      ],
      'expenses': [
        {'id': 1, 'expense_category_id': 7, 'category': {'id': 7, 'name': 'Rent'},
         'description': 'Rent', 'amount': 300.0, 'payment_method': 'cash', 'remarks': null},
      ],
      'deductions': [],
      'counter_transactions': [],
      'created_at': '2026-06-14T08:00:00+00:00',
      'updated_at': '2026-06-14T09:00:00+00:00',
    });

    expect(c.statusIsFinalized, isTrue);
    expect(c.cashInHand, 1550.0);
    expect(c.netPosition, 4600.0);
    expect(c.sales.single.amount, 2000.0);
    expect(c.expenses.single.category?.name, 'Rent');
  });
}
