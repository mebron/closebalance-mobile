import 'package:dio/dio.dart';
import '../error/app_exception.dart';

/// Converts dio errors into typed [AppException]s attached to the DioException.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final AppException appError;

    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        appError = AppException.network();
      case DioExceptionType.badResponse:
        final status = err.response?.statusCode ?? 0;
        final data = err.response?.data;
        appError = AppException.fromResponse(
          status,
          data is Map<String, dynamic> ? data : null,
        );
      default:
        appError = AppException(
          kind: AppExceptionKind.unknown,
          message: 'Something went wrong. Please try again.',
        );
    }

    handler.reject(err.copyWith(error: appError));
  }
}
