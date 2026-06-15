import 'package:closebalance_mobile/data/remote/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late AuthApi api;

  setUp(() {
    dio = _MockDio();
    api = AuthApi(dio);
  });

  test('login posts credentials and returns token + user', () async {
    when(() => dio.post('/auth/login', data: any(named: 'data'))).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/auth/login'),
        statusCode: 200,
        data: {
          'token': '1|abc',
          'token_type': 'Bearer',
          'expires_at': '2026-07-14T00:00:00Z',
          'user': {
            'id': 1,
            'name': 'Mujeeb',
            'email': 'mujeeb@mebron.com',
            'branch_id': null,
            'roles': ['admin'],
            'company': {'id': 1, 'name': 'CupCake', 'currency_symbol': '₹'},
          },
        },
      ),
    );

    final result = await api.login(
      email: 'mujeeb@mebron.com',
      password: 'secret',
      expiresInDays: 30,
    );

    expect(result.token, '1|abc');
    expect(result.user.name, 'Mujeeb');
    verify(() => dio.post('/auth/login', data: {
          'email': 'mujeeb@mebron.com',
          'password': 'secret',
          'expires_in_days': 30,
        })).called(1);
  });

  test('me unwraps the data envelope', () async {
    when(() => dio.get('/auth/me')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/auth/me'),
        statusCode: 200,
        data: {
          'data': {
            'id': 1,
            'name': 'Mujeeb',
            'email': 'mujeeb@mebron.com',
            'branch_id': null,
            'roles': ['admin'],
            'company': {'id': 1, 'name': 'CupCake', 'currency_symbol': '₹'},
          },
        },
      ),
    );

    final user = await api.me();
    expect(user.id, 1);
    expect(user.email, 'mujeeb@mebron.com');
  });
}
