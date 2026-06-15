import 'package:closebalance_mobile/core/storage/secure_token_store.dart';
import 'package:closebalance_mobile/data/models/user.dart';
import 'package:closebalance_mobile/data/remote/auth_api.dart';
import 'package:closebalance_mobile/data/repos/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthApi extends Mock implements AuthApi {}

class _FakeTokenStore implements TokenStore {
  String? _token;
  @override
  Future<void> clear() async => _token = null;
  @override
  Future<String?> read() async => _token;
  @override
  Future<void> write(String token) async => _token = token;
}

User _user() => User.fromJson({
      'id': 1,
      'name': 'Mujeeb',
      'email': 'mujeeb@mebron.com',
      'branch_id': null,
      'roles': ['admin'],
      'company': {'id': 1, 'name': 'CupCake', 'currency_symbol': '₹'},
    });

void main() {
  late _MockAuthApi api;
  late _FakeTokenStore store;
  late AuthRepository repo;

  setUp(() {
    api = _MockAuthApi();
    store = _FakeTokenStore();
    repo = AuthRepository(api, store);
  });

  test('login stores the token and returns the user', () async {
    when(() => api.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          expiresInDays: any(named: 'expiresInDays'),
        )).thenAnswer((_) async =>
        LoginResult(token: '1|abc', expiresAt: 'x', user: _user()));

    final user = await repo.login(
      email: 'mujeeb@mebron.com',
      password: 'secret',
      keepSignedIn: true,
    );

    expect(user.name, 'Mujeeb');
    expect(await store.read(), '1|abc');
  });

  test('keepSignedIn=false requests a short-lived token', () async {
    when(() => api.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          expiresInDays: any(named: 'expiresInDays'),
        )).thenAnswer((_) async =>
        LoginResult(token: 't', expiresAt: 'x', user: _user()));

    await repo.login(email: 'a@b.com', password: 'p', keepSignedIn: false);

    verify(() => api.login(
          email: 'a@b.com',
          password: 'p',
          expiresInDays: 1,
        )).called(1);
  });

  test('logout clears the token even if the API call fails', () async {
    await store.write('1|abc');
    when(() => api.logout()).thenThrow(Exception('network'));

    await repo.logout();

    expect(await store.read(), isNull);
  });

  test('currentToken reflects the stored token', () async {
    expect(await repo.currentToken(), isNull);
    await store.write('1|abc');
    expect(await repo.currentToken(), '1|abc');
  });
}
