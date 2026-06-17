// ignore_for_file: use_null_aware_elements
import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/counter_transaction.dart';
import '../models/editable/editable_closing.dart';

class CounterTransactionsApi {
  CounterTransactionsApi(this._dio);
  final Dio _dio;

  Future<CounterTransaction> create({
    required int closingId,
    required int counterId,
    required String date,
    required num saleAmount,
    required List<EditablePayment> payments,
    String? remarks,
  }) =>
      guardApi(() async {
        final res = await _dio.post('/daily-closings/$closingId/counter-transactions', data: {
          'counter_id': counterId,
          'date': date,
          'sale_amount': saleAmount,
          'payments': payments.map((p) => {'amount': p.amount, 'method': p.paymentMethod}).toList(),
          if (remarks != null) 'remarks': remarks,
        });
        return CounterTransaction.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<CounterTransaction> update({
    required int closingId,
    required int transactionId,
    required int counterId,
    required String date,
    required num saleAmount,
    required List<EditablePayment> payments,
    String? remarks,
  }) =>
      guardApi(() async {
        final res = await _dio.put('/daily-closings/$closingId/counter-transactions/$transactionId', data: {
          'counter_id': counterId,
          'date': date,
          'sale_amount': saleAmount,
          'payments': payments.map((p) => {'amount': p.amount, 'method': p.paymentMethod}).toList(),
          if (remarks != null) 'remarks': remarks,
        });
        return CounterTransaction.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<void> delete({required int closingId, required int transactionId}) =>
      guardApi(() async {
        await _dio.delete('/daily-closings/$closingId/counter-transactions/$transactionId');
      });
}
