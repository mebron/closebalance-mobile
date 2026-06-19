import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/app_exception.dart';
import '../../core/providers.dart';
import '../../data/models/user.dart';
import '../../data/repos/auth_repository.dart';

/// Holds the authenticated [User] (or null).
///
/// On cold start, serves the locally-cached profile immediately so the UI is
/// responsive before the network round-trip completes. The token is validated
/// in the background; only a 401 triggers a sign-out — network errors keep
/// the cached state so the app works offline.
class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final repo = ref.read(authRepositoryProvider);
    final token = await repo.currentToken();
    if (token == null) return null;

    // Serve cached profile instantly; validate token in the background.
    final cached = await repo.cachedUser();
    if (cached != null) {
      unawaited(_validateInBackground(repo));
      return cached;
    }

    // First launch after install — no cache yet, must wait for network.
    return _fetchAndCache(repo);
  }

  Future<void> _validateInBackground(AuthRepository repo) async {
    try {
      final fresh = await repo.refreshUser();
      await repo.cacheUser(fresh);
      state = AsyncData(fresh);
    } on AppException catch (e) {
      if (e.kind == AppExceptionKind.unauthorized) {
        await repo.logout();
        state = const AsyncData(null);
      }
      // Server / network errors: keep cached user, retry next launch.
    } catch (_) {
      // Provider disposed or unknown error — ignore.
    }
  }

  Future<User?> _fetchAndCache(AuthRepository repo) async {
    try {
      final user = await repo.refreshUser();
      await repo.cacheUser(user);
      return user;
    } catch (_) {
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
      try {
        await ref.read(referenceRepositoryProvider).refresh();
      } catch (_) {}
      return user;
    });
    if (state.hasError) throw state.error!;
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }

  Future<void> forceSignOut() async {
    await Future.wait([
      ref.read(tokenStoreProvider).clear(),
      ref.read(userCacheProvider).clear(),
    ]);
    state = const AsyncData(null);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(AuthController.new);
