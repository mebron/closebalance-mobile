import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/sync/editable_closing_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromDailyClosing produces a clean editable doc with server ids', () {
    final dc = DailyClosing.fromJson({
      'id': 9, 'date': '2026-06-15', 'status': 'draft', 'total_sales': 25000.0,
      'branch': {'id': 1, 'name': 'Main'}, 'notes': 'n',
      'sales': [{'id': 5, 'payment_channel_id': 4, 'payment_channel': {'id': 4, 'name': 'Cash', 'type': 'cash'}, 'amount': 12000.0}],
      'expenses': [{'id': 6, 'expense_category_id': 7, 'category': {'id': 7, 'name': 'Rent'}, 'description': 'Rent', 'amount': 300.0, 'payment_channel_id': 4, 'paid_via': 'Cash Counter', 'remarks': null}],
      'deductions': [{'id': 7, 'type': 'incentive', 'description': 'x', 'amount': 100.0, 'payment_channel_id': 4, 'paid_via': 'Cash Counter'}],
      'counter_transactions': [{'id': 8, 'counter_id': 2, 'counter': {'id': 2, 'name': 'C1'}, 'date': '2026-06-15', 'sale_amount': 500.0, 'paid_amount': 150.0, 'balance': 350.0, 'remarks': null}],
    });

    final e = EditableClosingMapper.fromDailyClosing(dc, branchId: 1);
    expect(e.serverId, 9);
    expect(e.branchId, 1);
    expect(e.headerDirty, isFalse);
    expect(e.sales.single.serverId, 5);
    expect(e.sales.single.dirty, isFalse);
    expect(e.expenses.single.serverId, 6);
    expect(e.deductions.single.serverId, 7);
    expect(e.counterTransactions.single.serverId, 8);
  });
}
