import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/report_summary.dart';
import 'package:closebalance_mobile/data/repos/reports_repository.dart';
import 'package:closebalance_mobile/features/reports/reports_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fixed_branch_notifier.dart';

class _MockReportsRepo extends Mock implements ReportsRepository {}

void main() {
  test('reportsSummaryProvider loads today summary for selected branch', () async {
    final repo = _MockReportsRepo();
    when(() => repo.summary(date: any(named: 'date'), branchId: 2))
        .thenAnswer((_) async => ReportSummary.fromJson({
              'date': '2026-06-14',
              'total_sales': 1.0,
              'cash_in_hand': 2.0,
              'draft_closings': 0,
              'finalized_closings': 1,
              'total_expenses': 0.0,
              'net_position': 1.0,
            }));

    final c = ProviderContainer(overrides: [
      reportsRepositoryProvider.overrideWithValue(repo),
      selectedBranchProvider.overrideWith(() => FixedBranchNotifier(2)),
    ]);
    addTearDown(c.dispose);

    final s = await c.read(reportsSummaryProvider.future);
    expect(s.finalizedClosings, 1);
  });
}
