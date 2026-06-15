import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/report_summary.dart';
import '../../data/sync/optimistic_summary.dart';

String _todayIso() {
  final now = DateTime.now();
  return '${now.year.toString().padLeft(4, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.day.toString().padLeft(2, '0')}';
}

/// Loads today's summary for the selected branch, applying queued offline
/// mutations as an optimistic overlay. Falls back to the cached summary offline.
class DashboardController extends AsyncNotifier<ReportSummary> {
  @override
  Future<ReportSummary> build() async {
    final branchId = ref.watch(selectedBranchProvider);
    final today = _todayIso();
    final reports = ref.read(reportsRepositoryProvider);

    ReportSummary base;
    try {
      base = await reports.summary(date: today, branchId: branchId);
    } on Object {
      base = await reports.cachedSummary(date: today, branchId: branchId) ??
          ReportSummary(
            date: today, totalSales: 0, cashInHand: 0, draftClosings: 0,
            finalizedClosings: 0, totalExpenses: 0, netPosition: 0,
          );
    }

    final pendings = await ref.read(offlineQueueProvider).pending();
    if (pendings.isEmpty) {
      return base;
    }
    final refData = await ref.read(referenceRepositoryProvider).cached();
    final channelTypes = <int, String>{
      for (final c in refData?.paymentChannels ?? const []) c.id: c.type,
    };
    return applyPending(base, pendings, channelTypes);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, ReportSummary>(DashboardController.new);
