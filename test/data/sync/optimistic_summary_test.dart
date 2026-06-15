import 'package:closebalance_mobile/data/models/pending_mutation.dart';
import 'package:closebalance_mobile/data/models/report_summary.dart';
import 'package:closebalance_mobile/data/sync/optimistic_summary.dart';
import 'package:flutter_test/flutter_test.dart';

ReportSummary _base() => ReportSummary.fromJson({
      'date': '2026-06-14', 'total_sales': 1000.0, 'cash_in_hand': 400.0,
      'draft_closings': 1, 'finalized_closings': 0, 'total_expenses': 200.0,
      'net_position': 800.0,
    });

void main() {
  test('adds pending cash sale to totals and cash in hand', () {
    final pendings = [
      const PendingMutation(id: 1, kind: MutationKind.sale, branchId: 1, date: '2026-06-14',
          payload: {'payment_channel_id': 4, 'amount': 500}),
    ];
    final out = applyPending(_base(), pendings, {4: 'cash'});
    expect(out.totalSales, 1500.0);
    expect(out.cashInHand, 900.0);
    expect(out.netPosition, 1300.0);
  });

  test('online (non-cash) pending sale lifts sales but not cash in hand', () {
    final pendings = [
      const PendingMutation(id: 1, kind: MutationKind.sale, branchId: 1, date: '2026-06-14',
          payload: {'payment_channel_id': 9, 'amount': 500}),
    ];
    final out = applyPending(_base(), pendings, {9: 'online'});
    expect(out.totalSales, 1500.0);
    expect(out.cashInHand, 400.0);
  });

  test('pending cash expense raises expenses and lowers cash in hand', () {
    final pendings = [
      const PendingMutation(id: 1, kind: MutationKind.expense, branchId: 1, date: '2026-06-14',
          payload: {'expense_category_id': 7, 'description': 'x', 'amount': 100, 'payment_method': 'cash'}),
    ];
    final out = applyPending(_base(), pendings, const {});
    expect(out.totalExpenses, 300.0);
    expect(out.cashInHand, 300.0);
    expect(out.netPosition, 700.0);
  });
}
