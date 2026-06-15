import 'package:closebalance_mobile/data/models/report_summary.dart';
import 'package:closebalance_mobile/data/remote/reports_api.dart';
import 'package:closebalance_mobile/data/repos/reports_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockReportsApi extends Mock implements ReportsApi {}

ReportSummary _summary() => ReportSummary.fromJson({
      'date': '2026-06-14', 'total_sales': 25000.0, 'cash_in_hand': 8500.0,
      'draft_closings': 1, 'finalized_closings': 0, 'total_expenses': 1200.0,
      'net_position': 23800.0,
    });

void main() {
  late _MockReportsApi api;
  late ReportsRepository repo;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    api = _MockReportsApi();
    repo = ReportsRepository(api);
  });

  test('summary fetches, caches, and cachedSummary reads it back', () async {
    when(() => api.summary(date: '2026-06-14', branchId: 2))
        .thenAnswer((_) async => _summary());

    final s = await repo.summary(date: '2026-06-14', branchId: 2);
    expect(s.totalSales, 25000.0);

    final cached = await ReportsRepository(api).cachedSummary(date: '2026-06-14', branchId: 2);
    expect(cached?.cashInHand, 8500.0);
  });

  test('cachedSummary returns null when nothing cached', () async {
    expect(await repo.cachedSummary(date: '2026-06-14', branchId: null), isNull);
  });
}
