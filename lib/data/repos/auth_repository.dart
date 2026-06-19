import '../../core/storage/secure_token_store.dart';
import '../../core/storage/user_cache_service.dart';
import '../models/user.dart';
import '../remote/auth_api.dart';

class AuthRepository {
  AuthRepository(this._api, this._tokenStore, this._userCache);

  final AuthApi _api;
  final TokenStore _tokenStore;
  final UserCacheService _userCache;

  Future<User> login({
    required String email,
    required String password,
    required bool keepSignedIn,
  }) async {
    final result = await _api.login(
      email: email,
      password: password,
      expiresInDays: keepSignedIn ? 30 : 1,
    );
    await Future.wait([
      _tokenStore.write(result.token),
      _userCache.save(result.user),
    ]);
    return result.user;
  }

  Future<void> logout() async {
    try {
      await _api.logout();
    } catch (_) {}
    await Future.wait([_tokenStore.clear(), _userCache.clear()]);
  }

  Future<String?> currentToken() => _tokenStore.read();
  Future<User?> cachedUser() => _userCache.load();
  Future<void> cacheUser(User user) => _userCache.save(user);
  Future<User> refreshUser() => _api.me();
}
