import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user.dart';

/// Persists the last-known [User] profile so the app can start instantly
/// without waiting for a network round-trip to /auth/me.
class UserCacheService {
  static const _key = 'cb_cached_user';
  SharedPreferences? _prefs;

  Future<SharedPreferences> _sp() async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<User?> load() async {
    final prefs = await _sp();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    try {
      return User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> save(User user) async {
    final prefs = await _sp();
    await prefs.setString(_key, jsonEncode(user.toJson()));
  }

  Future<void> clear() async {
    final prefs = await _sp();
    await prefs.remove(_key);
  }
}
