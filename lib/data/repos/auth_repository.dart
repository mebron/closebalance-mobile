import '../../core/storage/secure_token_store.dart';
import '../models/user.dart';
import '../remote/auth_api.dart';

class AuthRepository {
  AuthRepository(this._api, this._tokenStore);

  final AuthApi _api;
  final TokenStore _tokenStore;

  /// 30-day token when "keep me signed in", otherwise a 1-day token.
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
    await _tokenStore.write(result.token);
    return result.user;
  }

  Future<void> logout() async {
    try {
      await _api.logout();
    } catch (_) {
      // Best-effort: even if the server call fails we still drop the local token.
    } finally {
      await _tokenStore.clear();
    }
  }

  Future<String?> currentToken() => _tokenStore.read();

  Future<User> refreshUser() => _api.me();
}
