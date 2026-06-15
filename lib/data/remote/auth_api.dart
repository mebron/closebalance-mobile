import 'package:dio/dio.dart';
import '../../core/network/api_guard.dart';
import '../models/user.dart';

class LoginResult {
  LoginResult({required this.token, required this.expiresAt, required this.user});
  final String token;
  final String expiresAt;
  final User user;
}

class AuthApi {
  AuthApi(this._dio);
  final Dio _dio;

  Future<LoginResult> login({
    required String email,
    required String password,
    required int expiresInDays,
  }) async {
    return guardApi(() async {
      final res = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
        'expires_in_days': expiresInDays,
      });

      final data = res.data as Map<String, dynamic>;
      return LoginResult(
        token: data['token'] as String,
        expiresAt: data['expires_at'] as String,
        user: User.fromJson(data['user'] as Map<String, dynamic>),
      );
    });
  }

  Future<User> me() async {
    return guardApi(() async {
      final res = await _dio.get('/auth/me');
      final body = res.data;
      final data = body is Map<String, dynamic> ? body['data'] : null;
      if (data is! Map<String, dynamic>) {
        throw const FormatException('Unexpected /auth/me response shape');
      }
      return User.fromJson(data);
    });
  }

  Future<void> logout() async {
    return guardApi(() async {
      await _dio.post('/auth/logout');
    });
  }
}
