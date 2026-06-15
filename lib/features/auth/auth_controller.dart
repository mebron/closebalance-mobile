import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/user.dart';

/// Holds the authenticated [User] (or null). `build` hydrates from a stored token.
class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final repo = ref.read(authRepositoryProvider);
    final token = await repo.currentToken();
    if (token == null) {
      return null;
    }
    try {
      return await repo.refreshUser();
    } catch (_) {
      // Token invalid/expired — treat as signed out.
      await repo.logout();
      return null;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required bool keepSignedIn,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).login(
            email: email,
            password: password,
            keepSignedIn: keepSignedIn,
          );
      // Best-effort reference load; failure must not block login.
      try {
        await ref.read(referenceRepositoryProvider).refresh();
      } catch (_) {}
      return user;
    });
    // Surface a thrown AppException to the caller for inline form errors.
    if (state.hasError) {
      throw state.error!;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }

  /// Force sign-out without an API call (used when the server rejects our token).
  Future<void> forceSignOut() async {
    await ref.read(tokenStoreProvider).clear();
    state = const AsyncData(null);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(AuthController.new);
