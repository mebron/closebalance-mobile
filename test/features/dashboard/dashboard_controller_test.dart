import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/report_summary.dart';
import 'package:closebalance_mobile/data/repos/reports_repository.dart';
import 'package:closebalance_mobile/features/dashboard/dashboard_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_editable_closing_store.dart';
import '../../support/fixed_branch_notifier.dart';

class _MockReportsRepo extends Mock implements ReportsRepository {}

ReportSummary _summary() => ReportSummary.fromJson({
      'date': '2026-06-14', 'total_sales': 25000.0, 'cash_in_hand': 8500.0,
      'draft_closings': 0, 'finalized_closings': 0, 'total_expenses': 1200.0,
      'net_position': 23800.0,
    });

void main() {
  test('loads the summary for the selected branch', () async {
    final repo = _MockReportsRepo();
    when(() => repo.cachedSummary(date: any(named: 'date'), branchId: any(named: 'branchId')))
        .thenAnswer((_) async => null);
    when(() => repo.summary(date: any(named: 'date'), branchId: any(named: 'branchId')))
        .thenAnswer((_) async => _summary());

    final c = ProviderContainer(overrides: [
      reportsRepositoryProvider.overrideWithValue(repo),
      selectedBranchProvider.overrideWith(() => FixedBranchNotifier(2)),
      editableClosingStoreProvider.overrideWithValue(FakeEditableClosingStore()),
    ]);
    addTearDown(c.dispose);

    final summary = await c.read(dashboardControllerProvider.future);
    expect(summary.totalSales, 25000.0);
    verify(() => repo.summary(date: any(named: 'date'), branchId: 2)).called(1);
  });
}
