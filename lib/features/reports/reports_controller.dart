import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/report_summary.dart';

String _todayIso() {
  final n = DateTime.now();
  return '${n.year.toString().padLeft(4, '0')}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
}

/// Today's summary for the Reports landing tab.
final reportsSummaryProvider = FutureProvider.autoDispose<ReportSummary>((ref) async {
  final branchId = ref.watch(selectedBranchProvider);
  return ref.read(reportsRepositoryProvider).summary(date: _todayIso(), branchId: branchId);
});
