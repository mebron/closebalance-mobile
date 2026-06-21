// ignore_for_file: use_null_aware_elements
import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/deduction.dart';

class DeductionsApi {
  DeductionsApi(this._dio);
  final Dio _dio;

  Future<Deduction> create({
    required int closingId,
    required String type,
    required String description,
    required num amount,
    required int paymentChannelId,
  }) =>
      guardApi(() async {
        final res = await _dio.post('/daily-closings/$closingId/deductions', data: {
          'type': type,
          'description': description,
          'amount': amount,
          'payment_channel_id': paymentChannelId,
        });
        return Deduction.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<Deduction> update({
    required int closingId,
    required int deductionId,
    required String type,
    required String description,
    required num amount,
    required int paymentChannelId,
  }) =>
      guardApi(() async {
        final res = await _dio.put('/daily-closings/$closingId/deductions/$deductionId', data: {
          'type': type,
          'description': description,
          'amount': amount,
          'payment_channel_id': paymentChannelId,
        });
        return Deduction.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<void> delete({required int closingId, required int deductionId}) =>
      guardApi(() async {
        await _dio.delete('/daily-closings/$closingId/deductions/$deductionId');
      });
}
