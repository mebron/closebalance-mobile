import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/report_rows.dart';
import '../../data/models/report_summary.dart';

String _todayIso() {
  final n = DateTime.now();
  return '${n.year.toString().padLeft(4, '0')}-'
      '${n.month.toString().padLeft(2, '0')}-'
      '${n.day.toString().padLeft(2, '0')}';
}

/// Currently selected date on the Reports screen.
class ReportSelectedDateNotifier extends Notifier<String> {
  @override
  String build() => _todayIso();

  void select(String date) => state = date;
}

final reportSelectedDateProvider =
    NotifierProvider<ReportSelectedDateNotifier, String>(ReportSelectedDateNotifier.new);

/// Summary for the selected date.
final reportsSummaryProvider = FutureProvider.autoDispose<ReportSummary>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).summary(date: date, branchId: branchId);
});

/// Sales breakdown by payment channel for the selected date.
final reportsChannelsProvider = FutureProvider.autoDispose<List<ChannelSaleTotal>>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).channels(date: date, branchId: branchId);
});

/// Expense totals by category for the selected date.
final reportsExpensesProvider = FutureProvider.autoDispose<List<ExpenseCategoryTotal>>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).expensesByCategory(
        dateFrom: date, dateTo: date, branchId: branchId);
});

/// Counter transaction totals for the selected date.
final reportsCountersProvider = FutureProvider.autoDispose<List<CounterBalanceRow>>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).counterBalance(
        dateFrom: date, dateTo: date, branchId: branchId);
});
