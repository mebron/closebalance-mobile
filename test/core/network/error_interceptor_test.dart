import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:closebalance_mobile/core/network/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      DioException(requestOptions: RequestOptions(path: '/')),
    );
  });

  test('converts a 422 DioException into an AppException', () {
    final interceptor = ErrorInterceptor();
    final handler = _MockHandler();
    final options = RequestOptions(path: '/daily-closings');

    final err = DioException(
      requestOptions: options,
      response: Response(
        requestOptions: options,
        statusCode: 422,
        data: {
          'message': 'Invalid.',
          'errors': {'amount': ['Required.']},
        },
      ),
      type: DioExceptionType.badResponse,
    );

    interceptor.onError(err, handler);

    final captured = verify(() => handler.reject(captureAny())).captured.single
        as DioException;
    final appError = captured.error as AppException;
    expect(appError.kind, AppExceptionKind.validation);
    expect(appError.fieldErrors['amount'], ['Required.']);
  });

  test('converts a connection error into a network AppException', () {
    final interceptor = ErrorInterceptor();
    final handler = _MockHandler();
    final options = RequestOptions(path: '/');

    final err = DioException(
      requestOptions: options,
      type: DioExceptionType.connectionError,
    );

    interceptor.onError(err, handler);

    final captured = verify(() => handler.reject(captureAny())).captured.single
        as DioException;
    expect((captured.error as AppException).kind, AppExceptionKind.network);
  });
}
