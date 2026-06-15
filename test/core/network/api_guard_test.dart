import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:closebalance_mobile/core/network/api_guard.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('rethrows the AppException carried inside a DioException', () async {
    await expectLater(
      () => guardApi<int>(() async => throw DioException(
            requestOptions: RequestOptions(path: '/'),
            error: AppException(
                kind: AppExceptionKind.unauthorized, message: 'Invalid credentials.'),
          )),
      throwsA(isA<AppException>()
          .having((e) => e.kind, 'kind', AppExceptionKind.unauthorized)
          .having((e) => e.message, 'message', 'Invalid credentials.')),
    );
  });

  test('maps a bare DioException with no AppException to unknown', () async {
    await expectLater(
      () => guardApi<int>(() async => throw DioException(
            requestOptions: RequestOptions(path: '/'))),
      throwsA(isA<AppException>().having((e) => e.kind, 'kind', AppExceptionKind.unknown)),
    );
  });

  test('passes through a successful result', () async {
    expect(await guardApi<int>(() async => 42), 42);
  });

  test('rethrows an already-typed AppException', () async {
    await expectLater(
      () => guardApi<int>(() async =>
          throw AppException(kind: AppExceptionKind.network, message: 'offline')),
      throwsA(isA<AppException>().having((e) => e.kind, 'kind', AppExceptionKind.network)),
    );
  });
}
