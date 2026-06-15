import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/branch.dart';
import '../models/counter.dart';
import '../models/expense_category.dart';
import '../models/payment_channel.dart';

class ReferenceApi {
  ReferenceApi(this._dio);
  final Dio _dio;

  Future<List<Branch>> branches() async {
    return guardApi(() async {
      final res = await _dio.get('/branches');
      return _list(res.data).map((e) => Branch.fromJson(e)).toList();
    });
  }

  Future<List<PaymentChannel>> paymentChannels() async {
    return guardApi(() async {
      final res = await _dio.get('/payment-channels');
      return _list(res.data).map((e) => PaymentChannel.fromJson(e)).toList();
    });
  }

  Future<List<ExpenseCategory>> expenseCategories() async {
    return guardApi(() async {
      final res = await _dio.get('/expense-categories');
      return _list(res.data).map((e) => ExpenseCategory.fromJson(e)).toList();
    });
  }

  Future<String> currencySymbol() async {
    return guardApi(() async {
      final res = await _dio.get('/settings');
      final data = res.data as Map<String, dynamic>;
      return (data['currency_symbol'] as String?) ?? '₹';
    });
  }

  Future<List<Counter>> counters() async {
    return guardApi(() async {
      final res = await _dio.get('/counters');
      return _list(res.data).map((e) => Counter.fromJson(e)).toList();
    });
  }

  List<Map<String, dynamic>> _list(dynamic body) {
    final data = (body as Map<String, dynamic>)['data'] as List;
    return data.cast<Map<String, dynamic>>();
  }
}
