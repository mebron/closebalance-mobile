import 'package:dio/dio.dart';

class DeviceTokenApi {
  const DeviceTokenApi(this._dio);
  final Dio _dio;

  Future<void> register(String token, String platform) async {
    await _dio.post<void>(
      '/api/v1/device-tokens',
      data: {'token': token, 'platform': platform},
    );
  }

  Future<void> deregister(String token) async {
    await _dio.delete<void>('/api/v1/device-tokens/$token');
  }
}
