import 'package:closebalance_mobile/core/config/flavor_config.dart';
import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/repos/auth_repository.dart';
import 'package:closebalance_mobile/data/repos/reference_repository.dart';
import 'package:closebalance_mobile/features/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepo extends Mock implements AuthRepository {}

class _MockReferenceRepo extends Mock implements ReferenceRepository {}

Widget _app(_MockAuthRepo auth, _MockReferenceRepo refRepo) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(auth),
      referenceRepositoryProvider.overrideWithValue(refRepo),
    ],
    child: const MaterialApp(home: LoginScreen()),
  );
}

void main() {
  setUpAll(() {
    registerFallbackValue('');
    FlavorConfig.setInstance(const FlavorConfig(
      flavor: Flavor.closebalance,
      primaryColor: Color(0xFF1A56DB),
      accentColor: Color(0xFF1A56DB),
      bgColor: Color(0xFF1A56DB),
      appName: 'Test',
    ));
  });

  late _MockAuthRepo auth;
  late _MockReferenceRepo refRepo;

  setUp(() {
    auth = _MockAuthRepo();
    refRepo = _MockReferenceRepo();
    when(() => auth.currentToken()).thenAnswer((_) async => null);
    when(() => refRepo.refresh())
        .thenAnswer((_) async => throw UnimplementedError());
  });

  testWidgets('shows a validation error for an empty email', (tester) async {
    await tester.pumpWidget(_app(auth, refRepo));
    await tester.pump();
    await tester.tap(find.text('Sign in'));
    await tester.pump();
    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('shows the API message on invalid credentials', (tester) async {
    when(() => auth.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
          keepSignedIn: any(named: 'keepSignedIn'),
        )).thenThrow(AppException(
      kind: AppExceptionKind.unauthorized,
      message: 'Invalid credentials.',
    ));

    await tester.pumpWidget(_app(auth, refRepo));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('login_email')), 'a@b.com');
    await tester.enterText(find.byKey(const Key('login_password')), 'wrong');
    await tester.tap(find.text('Sign in'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Invalid credentials.'), findsOneWidget);
  });
}
