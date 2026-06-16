import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/day_report.dart';
import '../models/report_rows.dart';
import '../models/report_summary.dart';
import '../remote/reports_api.dart';

class ReportsRepository {
  ReportsRepository(this._api);
  final ReportsApi _api;

  String _summaryKey(String date, int? branchId) => 'cb_summary_${branchId ?? 'all'}_$date';

  Future<ReportSummary> summary({required String date, int? branchId}) async {
    final s = await _api.summary(date: date, branchId: branchId);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_summaryKey(date, branchId), jsonEncode(s.toJson()));
    return s;
  }

  Future<ReportSummary?> cachedSummary({required String date, int? branchId}) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_summaryKey(date, branchId));
    if (raw == null) {
      return null;
    }
    return ReportSummary.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<List<DailyBranchRow>> dailyBranch({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) =>
      _api.dailyBranch(dateFrom: dateFrom, dateTo: dateTo, branchId: branchId);

  Future<List<ExpenseCategoryTotal>> expensesByCategory({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) =>
      _api.expensesByCategory(dateFrom: dateFrom, dateTo: dateTo, branchId: branchId);

  Future<List<CounterBalanceRow>> counterBalance({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) =>
      _api.counterBalance(dateFrom: dateFrom, dateTo: dateTo, branchId: branchId);

  Future<DayReport> day({String? date, int? branchId}) =>
      _api.day(date: date, branchId: branchId);
}
