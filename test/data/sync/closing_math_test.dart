import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/sync/closing_math.dart';
import 'package:flutter_test/flutter_test.dart';

EditableClosing _c() => EditableClosing(
      branchId: 1, date: '2026-06-15', status: ClosingStatus.draft, totalSales: 25000,
      sales: const [
        EditableSale(clientId: 'a', paymentChannelId: 4, amount: 12000),
        EditableSale(clientId: 'b', paymentChannelId: 9, amount: 10500),
        EditableSale(clientId: 'd', paymentChannelId: 1, amount: 100, deleted: true),
      ],
      expenses: const [
        EditableExpense(clientId: 'e', expenseCategoryId: 7, amount: 1000, paymentMethod: 'cash'),
        EditableExpense(clientId: 'f', expenseCategoryId: 7, amount: 200, paymentMethod: 'bank'),
      ],
      deductions: const [
        EditableDeduction(clientId: 'g', type: 'incentive', amount: 100, paymentMethod: 'cash'),
      ],
      counterTransactions: const [
        EditableCounterTxn(clientId: 'h', counterId: 2, saleAmount: 500, paidAmount: 150),
      ],
    );

void main() {
  const channelTypes = {4: 'cash', 9: 'online', 1: 'cash'};

  test('collected and difference ignore deleted lines', () {
    expect(ClosingMath.collected(_c()), 22500);
    expect(ClosingMath.difference(_c()), 2500);
  });

  test('channel splits by type', () {
    expect(ClosingMath.cashCollections(_c(), channelTypes), 12000);
    expect(ClosingMath.onlineCollections(_c(), channelTypes), 10500);
  });

  test('totals', () {
    expect(ClosingMath.totalExpenses(_c()), 1200);
    expect(ClosingMath.totalDeductions(_c()), 100);
    expect(ClosingMath.counterPaid(_c()), 150);
  });

  test('cash in hand and net position', () {
    expect(ClosingMath.cashInHand(_c(), channelTypes), 10750);
    expect(ClosingMath.netPosition(_c()), 23700);
  });
}
