// ignore_for_file: use_null_aware_elements
import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/daily_closing.dart';
import '../models/paginated.dart';

class ClosingsApi {
  ClosingsApi(this._dio);
  final Dio _dio;

  Future<Paginated<DailyClosing>> index({
    String? dateFrom,
    String? dateTo,
    int? branchId,
    String? status,
    int page = 1,
  }) async {
    return guardApi(() async {
      final res = await _dio.get('/daily-closings', queryParameters: {
        if (dateFrom != null) 'date_from': dateFrom,
        if (dateTo != null) 'date_to': dateTo,
        if (branchId != null) 'branch_id': branchId,
        if (status != null) 'status': status,
        'page': page,
      });
      final body = res.data as Map<String, dynamic>;
      final items = (body['data'] as List)
          .map((e) => DailyClosing.fromJson(e as Map<String, dynamic>))
          .toList();
      return Paginated(
        items: items,
        meta: PageMeta.fromJson(body['meta'] as Map<String, dynamic>),
      );
    });
  }

  Future<DailyClosing> store({
    required int branchId,
    required String date,
    required num totalSales,
    String? notes,
  }) async {
    return guardApi(() async {
      final res = await _dio.post('/daily-closings', data: {
        'branch_id': branchId,
        'date': date,
        'total_sales': totalSales,
        if (notes != null) 'notes': notes,
      });
      return _data(res);
    });
  }

  Future<DailyClosing> show(int id) async {
    return guardApi(() async => _data(await _dio.get('/daily-closings/$id')));
  }

  Future<DailyClosing> update(int id, {num? totalSales, String? notes}) async {
    return guardApi(() async {
      final res = await _dio.put('/daily-closings/$id', data: {
        if (totalSales != null) 'total_sales': totalSales,
        if (notes != null) 'notes': notes,
      });
      return _data(res);
    });
  }

  Future<DailyClosing> finalize(int id) async {
    return guardApi(() async => _data(await _dio.post('/daily-closings/$id/finalize')));
  }

  DailyClosing _data(Response<dynamic> res) => DailyClosing.fromJson(
      (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>);
}
