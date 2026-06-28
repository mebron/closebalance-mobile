import 'package:closebalance_mobile/data/remote/device_token_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late DeviceTokenApi api;

  setUp(() {
    mockDio = MockDio();
    api = DeviceTokenApi(mockDio);
  });

  group('register', () {
    test('POSTs to /api/v1/device-tokens', () async {
      when(() => mockDio.post<void>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 204,
          ));

      await api.register('my-token', 'android');

      verify(() => mockDio.post<void>(
            '/api/v1/device-tokens',
            data: {'token': 'my-token', 'platform': 'android'},
          )).called(1);
    });
  });

  group('deregister', () {
    test('DELETEs /api/v1/device-tokens/{token}', () async {
      when(() => mockDio.delete<void>(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 204,
          ));

      await api.deregister('my-token');

      verify(() => mockDio.delete<void>('/api/v1/device-tokens/my-token')).called(1);
    });
  });
}
