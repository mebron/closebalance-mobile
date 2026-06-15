import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/core/storage/secure_token_store.dart';
import 'package:closebalance_mobile/data/models/reference_data.dart';
import 'package:closebalance_mobile/data/models/user.dart';
import 'package:closebalance_mobile/data/repos/auth_repository.dart';
import 'package:closebalance_mobile/data/repos/reference_repository.dart';
import 'package:closebalance_mobile/features/auth/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepo extends Mock implements AuthRepository {}

class _MockReferenceRepo extends Mock implements ReferenceRepository {}

class _FakeTokenStore implements TokenStore {
  String? _t;

  @override
  Future<void> clear() async => _t = null;

  @override
  Future<String?> read() async => _t;

  @override
  Future<void> write(String token) async => _t = token;
}

User _user() => User.fromJson({
      'id': 1,
      'name': 'Mujeeb',
      'email': 'mujeeb@mebron.com',
      'branch_id': null,
      'roles': ['admin'],
      'company': {'id': 1, 'name': 'CupCake', 'currency_symbol': '₹'},
    });

ProviderContainer _container(_MockAuthRepo auth, _MockReferenceRepo ref_) {
  final c = ProviderContainer(overrides: [
    authRepositoryProvider.overrideWithValue(auth),
    referenceRepositoryProvider.overrideWithValue(ref_),
    tokenStoreProvider.overrideWithValue(_FakeTokenStore()),
  ]);
  addTearDown(c.dispose);
  return c;
}

void main() {
  late _MockAuthRepo auth;
  late _MockReferenceRepo refRepo;

  setUp(() {
    auth = _MockAuthRepo();
    refRepo = _MockReferenceRepo();
    when(() => refRepo.refresh()).thenAnswer((_) async => throw UnimplementedError());
  });

  test('starts signed out when no token is stored', () async {
    when(() => auth.currentToken()).thenAnswer((_) async => null);
    final c = _container(auth, refRepo);

    final user = await c.read(authControllerProvider.future);
    expect(user, isNull);
  });

  test('login succeeds even when reference load fails', () async {
    when(() => auth.currentToken()).thenAnswer((_) async => null);
    when(() => auth.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          keepSignedIn: any(named: 'keepSignedIn'),
        )).thenAnswer((_) async => _user());
    when(() => refRepo.refresh()).thenAnswer((_) async => throw UnimplementedError());

    final c = _container(auth, refRepo);
    await c.read(authControllerProvider.future);

    await c.read(authControllerProvider.notifier).login(
          email: 'mujeeb@mebron.com',
          password: 'secret',
          keepSignedIn: true,
        );

    expect(c.read(authControllerProvider).value?.name, 'Mujeeb');
  });

  test('login refreshes reference data on success', () async {
    when(() => auth.currentToken()).thenAnswer((_) async => null);
    when(() => auth.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          keepSignedIn: any(named: 'keepSignedIn'),
        )).thenAnswer((_) async => _user());
    when(() => refRepo.refresh()).thenAnswer((_) async => ReferenceData(
          branches: const [],
          paymentChannels: const [],
          expenseCategories: const [],
          currencySymbol: '₹',
          counters: const [],
        ));

    final c = _container(auth, refRepo);
    await c.read(authControllerProvider.future);
    await c.read(authControllerProvider.notifier).login(
          email: 'a@b.com', password: 'p', keepSignedIn: true);

    verify(() => refRepo.refresh()).called(1);
  });

  test('logout clears the current user', () async {
    when(() => auth.currentToken()).thenAnswer((_) async => 'tok');
    when(() => auth.refreshUser()).thenAnswer((_) async => _user());
    when(() => auth.logout()).thenAnswer((_) async {});

    final c = _container(auth, refRepo);
    await c.read(authControllerProvider.future);
    expect(c.read(authControllerProvider).value, isNotNull);

    await c.read(authControllerProvider.notifier).logout();
    expect(c.read(authControllerProvider).value, isNull);
  });

  test('forceSignOut clears the user without calling the API logout', () async {
    when(() => auth.currentToken()).thenAnswer((_) async => 'tok');
    when(() => auth.refreshUser()).thenAnswer((_) async => _user());

    final c = _container(auth, refRepo);
    await c.read(authControllerProvider.future);
    expect(c.read(authControllerProvider).value, isNotNull);

    await c.read(authControllerProvider.notifier).forceSignOut();

    expect(c.read(authControllerProvider).value, isNull);
    verifyNever(() => auth.logout());
  });
}
