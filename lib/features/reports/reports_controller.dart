import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/day_report.dart';
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

/// Full day report — summary + channel breakdown + expenses + counters in one call.
final dayReportProvider = FutureProvider.autoDispose<DayReport>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).day(date: date, branchId: branchId);
});

/// Kept for the dashboard summary card (separate lightweight call).
final reportsSummaryProvider = FutureProvider.autoDispose<ReportSummary>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  final date = ref.watch(reportSelectedDateProvider);
  return ref.read(reportsRepositoryProvider).summary(date: date, branchId: branchId);
});
