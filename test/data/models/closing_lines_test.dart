import 'package:closebalance_mobile/data/models/counter_transaction.dart';
import 'package:closebalance_mobile/data/models/deduction.dart';
import 'package:closebalance_mobile/data/models/expense_line.dart';
import 'package:closebalance_mobile/data/models/sale_line.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SaleLine parses with nested payment channel', () {
    final s = SaleLine.fromJson({
      'id': 1,
      'payment_channel_id': 4,
      'payment_channel': {'id': 4, 'name': 'Cash', 'type': 'cash'},
      'amount': 2000.0,
    });
    expect(s.id, 1);
    expect(s.paymentChannelId, 4);
    expect(s.paymentChannel?.type, 'cash');
    expect(s.amount, 2000.0);
  });

  test('ExpenseLine parses payment_method and nullable category', () {
    final e = ExpenseLine.fromJson({
      'id': 2,
      'expense_category_id': 7,
      'category': {'id': 7, 'name': 'Rent'},
      'description': 'Monthly rent',
      'amount': 300.0,
      'payment_method': 'cash',
      'remarks': null,
    });
    expect(e.category?.name, 'Rent');
    expect(e.paymentMethod, 'cash');
    expect(e.remarks, isNull);
  });

  test('Deduction parses type as string', () {
    final d = Deduction.fromJson({
      'id': 3,
      'type': 'salary_advance',
      'description': 'Advance',
      'amount': 100.0,
      'payment_method': 'cash',
    });
    expect(d.type, 'salary_advance');
    expect(d.amount, 100.0);
  });

  test('CounterTransaction parses nested counter name', () {
    final c = CounterTransaction.fromJson({
      'id': 5,
      'counter_id': 9,
      'counter': {'id': 9, 'name': 'Counter 1'},
      'date': '2026-06-14',
      'sale_amount': 500.0,
      'paid_amount': 150.0,
      'balance': 350.0,
      'remarks': null,
    });
    expect(c.counter?.name, 'Counter 1');
    expect(c.balance, 350.0);
  });
}
