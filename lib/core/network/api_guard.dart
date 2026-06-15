import 'package:dio/dio.dart';
import '../error/app_exception.dart';

/// Runs an API call and converts dio failures into typed [AppException]s.
/// Our [ErrorInterceptor] attaches an AppException to `DioException.error`;
/// dio still throws the DioException, so we unwrap it here so callers (controllers,
/// screens) can `catch (AppException)` and show a friendly message.
Future<T> guardApi<T>(Future<T> Function() request) async {
  try {
    return await request();
  } on AppException {
    rethrow;
  } on DioException catch (e) {
    final err = e.error;
    if (err is AppException) {
      throw err;
    }
    throw AppException(
      kind: AppExceptionKind.unknown,
      message: 'Something went wrong. Please try again.',
    );
  }
}
