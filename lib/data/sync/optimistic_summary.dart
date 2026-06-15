import '../models/pending_mutation.dart';
import '../models/report_summary.dart';

/// Returns a summary with locally-queued (not-yet-synced) mutations applied,
/// so the dashboard reflects the user's entries immediately — even offline.
///
/// [channelTypes] maps payment_channel_id -> type ('cash'|'online'|'aggregator').
ReportSummary applyPending(
  ReportSummary base,
  List<PendingMutation> pendings,
  Map<int, String> channelTypes,
) {
  var totalSales = base.totalSales;
  var totalExpenses = base.totalExpenses;
  var cashInHand = base.cashInHand;

  for (final m in pendings) {
    switch (m.kind) {
      case MutationKind.sale:
        totalSales += m.saleAmount.toDouble();
        if (channelTypes[m.paymentChannelId] == 'cash') {
          cashInHand += m.saleAmount.toDouble();
        }
      case MutationKind.expense:
        totalExpenses += m.expenseAmount.toDouble();
        if (m.paymentMethod == 'cash') {
          cashInHand -= m.expenseAmount.toDouble();
        }
    }
  }

  return ReportSummary(
    date: base.date,
    totalSales: totalSales,
    cashInHand: cashInHand,
    draftClosings: base.draftClosings,
    finalizedClosings: base.finalizedClosings,
    totalExpenses: totalExpenses,
    netPosition: totalSales - totalExpenses,
  );
}
