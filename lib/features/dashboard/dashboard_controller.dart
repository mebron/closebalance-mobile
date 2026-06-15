import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/report_summary.dart';
import '../../data/sync/closing_math.dart';

String _todayIso() {
  final now = DateTime.now();
  return '${now.year.toString().padLeft(4, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.day.toString().padLeft(2, '0')}';
}

/// Loads today's summary for the selected branch. Checks the local editable
/// closing store first; if found, derives the summary from it (local-first).
/// Falls back to the API, then to the cached summary, then to an empty summary.
class DashboardController extends AsyncNotifier<ReportSummary> {
  @override
  Future<ReportSummary> build() async {
    final branchId = ref.watch(selectedBranchProvider);
    final today = _todayIso();

    // If a local editable closing exists for today, derive the summary from it.
    if (branchId != null) {
      final local = await ref.read(editableClosingStoreProvider).load(branchId, today);
      if (local != null) {
        final refData = await ref.read(referenceRepositoryProvider).cached();
        final types = <int, String>{
          for (final c in refData?.paymentChannels ?? const []) c.id: c.type,
        };
        return ClosingMath.toSummary(local, types);
      }
    }

    final reports = ref.read(reportsRepositoryProvider);
    try {
      return await reports.summary(date: today, branchId: branchId);
    } on Object {
      return await reports.cachedSummary(date: today, branchId: branchId) ??
          ReportSummary(
            date: today, totalSales: 0, cashInHand: 0, draftClosings: 0,
            finalizedClosings: 0, totalExpenses: 0, netPosition: 0,
          );
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, ReportSummary>(DashboardController.new);
