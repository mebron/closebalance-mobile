// ignore_for_file: use_null_aware_elements
import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/report_rows.dart';
import '../models/report_summary.dart';

class ReportsApi {
  ReportsApi(this._dio);
  final Dio _dio;

  Future<ReportSummary> summary({String? date, int? branchId}) async {
    return guardApi(() async {
      final res = await _dio.get('/reports/summary', queryParameters: {
        if (date != null) 'date': date,
        if (branchId != null) 'branch_id': branchId,
      });
      return ReportSummary.fromJson(res.data as Map<String, dynamic>);
    });
  }

  Future<List<DailyBranchRow>> dailyBranch({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) async {
    return guardApi(() async {
      final res = await _dio.get('/reports/daily-branch', queryParameters: {
        'date_from': dateFrom,
        'date_to': dateTo,
        if (branchId != null) 'branch_id': branchId,
      });
      return _list(res).map((e) => DailyBranchRow.fromJson(e)).toList();
    });
  }

  Future<List<ExpenseCategoryTotal>> expensesByCategory({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) async {
    return guardApi(() async {
      final res = await _dio.get('/reports/expenses', queryParameters: {
        'date_from': dateFrom,
        'date_to': dateTo,
        if (branchId != null) 'branch_id': branchId,
      });
      return _list(res).map((e) => ExpenseCategoryTotal.fromJson(e)).toList();
    });
  }

  Future<List<CounterBalanceRow>> counterBalance({
    required String dateFrom,
    required String dateTo,
    int? branchId,
  }) async {
    return guardApi(() async {
      final res = await _dio.get('/reports/counter-balance', queryParameters: {
        'date_from': dateFrom,
        'date_to': dateTo,
        if (branchId != null) 'branch_id': branchId,
      });
      return _list(res).map((e) => CounterBalanceRow.fromJson(e)).toList();
    });
  }

  List<Map<String, dynamic>> _list(Response res) =>
      ((res.data as Map<String, dynamic>)['data'] as List).cast<Map<String, dynamic>>();
}
