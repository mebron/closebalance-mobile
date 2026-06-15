import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../storage/secure_token_store.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';

Dio buildDio(TokenStore tokenStore, {void Function()? onUnauthorized}) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiV1,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {'Accept': 'application/json'},
  ));

  // AuthInterceptor first (adds token, observes 401), ErrorInterceptor last
  // so it maps the final error into an AppException.
  dio.interceptors.add(AuthInterceptor(tokenStore, onUnauthorized: onUnauthorized));
  dio.interceptors.add(ErrorInterceptor());

  return dio;
}
