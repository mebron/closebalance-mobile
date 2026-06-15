import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/sale_line.dart';

class SalesApi {
  SalesApi(this._dio);
  final Dio _dio;

  Future<SaleLine> create({
    required int closingId,
    required int paymentChannelId,
    required num amount,
  }) async {
    return guardApi(() async {
      final res = await _dio.post('/daily-closings/$closingId/sales', data: {
        'payment_channel_id': paymentChannelId,
        'amount': amount,
      });
      return SaleLine.fromJson(
          (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
    });
  }

  Future<SaleLine> update({
    required int closingId,
    required int saleId,
    required int paymentChannelId,
    required num amount,
  }) =>
      guardApi(() async {
        final res = await _dio.put('/daily-closings/$closingId/sales/$saleId',
            data: {'payment_channel_id': paymentChannelId, 'amount': amount});
        return SaleLine.fromJson(
            (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
      });

  Future<void> delete({required int closingId, required int saleId}) async {
    return guardApi(() async {
      await _dio.delete('/daily-closings/$closingId/sales/$saleId');
    });
  }
}
