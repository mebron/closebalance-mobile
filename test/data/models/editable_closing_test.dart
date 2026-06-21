import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('EditableClosing round-trips through json', () {
    final c = EditableClosing(
      serverId: 9, branchId: 1, date: '2026-06-15', status: ClosingStatus.draft,
      notes: 'n', totalSales: 25000,
      sales: [const EditableSale(clientId: 's1', serverId: 5, paymentChannelId: 4, amount: 12000)],
      expenses: [const EditableExpense(clientId: 'e1', expenseCategoryId: 7, description: 'Rent', amount: 300, paymentChannelId: 4)],
      deductions: const [],
      counterTransactions: const [],
    );
    final back = EditableClosing.fromJson(c.toJson());
    expect(back.serverId, 9);
    expect(back.status, ClosingStatus.draft);
    expect(back.sales.single.amount, 12000);
    expect(back.expenses.single.description, 'Rent');
  });
}
