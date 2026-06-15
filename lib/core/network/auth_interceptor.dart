import 'package:dio/dio.dart';
import '../storage/secure_token_store.dart';

/// Attaches the bearer token to every request and signals 401s upward.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStore, {this.onUnauthorized});

  final TokenStore _tokenStore;
  final void Function()? onUnauthorized;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.read();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      onUnauthorized?.call();
    }
    handler.next(err);
  }
}
