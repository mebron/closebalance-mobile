import '../models/editable/editable_closing.dart';
import '../models/report_summary.dart';
import '../models/closing_status.dart';

/// Pure derived calculations for a closing document. `channelTypes` maps
/// payment_channel_id -> 'cash'|'online'|'aggregator'. Deleted lines are ignored.
abstract final class ClosingMath {
  static Iterable<EditableSale> _sales(EditableClosing c) => c.sales.where((s) => !s.deleted);
  static Iterable<EditableExpense> _expenses(EditableClosing c) => c.expenses.where((e) => !e.deleted);
  static Iterable<EditableDeduction> _deductions(EditableClosing c) => c.deductions.where((d) => !d.deleted);
  static Iterable<EditableCounterTxn> _counters(EditableClosing c) => c.counterTransactions.where((t) => !t.deleted);

  static double collected(EditableClosing c) => _sales(c).fold(0.0, (s, x) => s + x.amount);
  static double difference(EditableClosing c) => c.totalSales - collected(c);

  static double _byType(EditableClosing c, Map<int, String> types, String type) =>
      _sales(c).where((s) => types[s.paymentChannelId] == type).fold(0.0, (s, x) => s + x.amount);

  static double cashCollections(EditableClosing c, Map<int, String> t) => _byType(c, t, 'cash');
  static double onlineCollections(EditableClosing c, Map<int, String> t) => _byType(c, t, 'online');
  static double aggregatorCollections(EditableClosing c, Map<int, String> t) => _byType(c, t, 'aggregator');

  static double totalExpenses(EditableClosing c) => _expenses(c).fold(0.0, (s, x) => s + x.amount);
  static double totalDeductions(EditableClosing c) => _deductions(c).fold(0.0, (s, x) => s + x.amount);
  static double counterPaid(EditableClosing c) => _counters(c).fold(0.0, (s, x) => s + x.paidAmount);

  static double _cashExpenses(EditableClosing c) =>
      _expenses(c).where((e) => e.paymentMethod == 'cash').fold(0.0, (s, x) => s + x.amount);
  static double _cashDeductions(EditableClosing c) =>
      _deductions(c).where((d) => d.paymentMethod == 'cash').fold(0.0, (s, x) => s + x.amount);

  static double cashInHand(EditableClosing c, Map<int, String> t) =>
      cashCollections(c, t) - counterPaid(c) - _cashExpenses(c) - _cashDeductions(c);

  static double netProfit(EditableClosing c) =>
      c.totalSales - totalExpenses(c) - totalDeductions(c);

  static ReportSummary toSummary(EditableClosing c, Map<int, String> t) => ReportSummary(
        date: c.date,
        totalSales: c.totalSales,
        cashInHand: cashInHand(c, t),
        draftClosings: c.status == ClosingStatus.draft ? 1 : 0,
        finalizedClosings: c.status == ClosingStatus.finalized ? 1 : 0,
        totalExpenses: totalExpenses(c),
        netProfit: netProfit(c),
      );
}
