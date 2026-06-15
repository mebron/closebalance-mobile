// ignore_for_file: use_null_aware_elements
import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/expense_line.dart';

class ExpensesApi {
  ExpensesApi(this._dio);
  final Dio _dio;

  Future<ExpenseLine> create({
    required int closingId,
    required int expenseCategoryId,
    required String description,
    required num amount,
    required String paymentMethod,
    String? remarks,
  }) async {
    return guardApi(() async {
      final res = await _dio.post('/daily-closings/$closingId/expenses', data: {
        'expense_category_id': expenseCategoryId,
        'description': description,
        'amount': amount,
        'payment_method': paymentMethod,
        if (remarks != null) 'remarks': remarks,
      });
      return ExpenseLine.fromJson(
          (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
    });
  }

  Future<ExpenseLine> update({
    required int closingId,
    required int expenseId,
    required int expenseCategoryId,
    required String description,
    required num amount,
    required String paymentMethod,
    String? remarks,
  }) =>
      guardApi(() async {
        final res = await _dio.put('/daily-closings/$closingId/expenses/$expenseId', data: {
          'expense_category_id': expenseCategoryId,
          'description': description,
          'amount': amount,
          'payment_method': paymentMethod,
          if (remarks != null) 'remarks': remarks,
        });
        return ExpenseLine.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<void> delete({required int closingId, required int expenseId}) async {
    return guardApi(() async {
      await _dio.delete('/daily-closings/$closingId/expenses/$expenseId');
    });
  }
}
