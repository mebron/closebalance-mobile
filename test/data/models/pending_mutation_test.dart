import 'package:closebalance_mobile/data/models/pending_mutation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sale payload round-trips through json', () {
    const m = PendingMutation(
      id: 1, kind: MutationKind.sale, branchId: 2, date: '2026-06-14',
      payload: {'payment_channel_id': 4, 'amount': 500});
    final json = m.payloadJson();
    final back = PendingMutation.fromParts(
        id: 1, kind: 'sale', branchId: 2, date: '2026-06-14', payloadJson: json);
    expect(back.kind, MutationKind.sale);
    expect(back.payload['amount'], 500);
  });

  test('saleAmount and channelId helpers read the payload', () {
    const m = PendingMutation(
      id: 1, kind: MutationKind.sale, branchId: 2, date: '2026-06-14',
      payload: {'payment_channel_id': 4, 'amount': 500});
    expect(m.saleAmount, 500);
    expect(m.paymentChannelId, 4);
  });

  test('expense helpers read the payload', () {
    const m = PendingMutation(
      id: 2, kind: MutationKind.expense, branchId: 2, date: '2026-06-14',
      payload: {'expense_category_id': 7, 'description': 'Rent', 'amount': 300, 'payment_method': 'cash'});
    expect(m.expenseAmount, 300);
    expect(m.paymentMethod, 'cash');
  });
}
