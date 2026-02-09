import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyIsLoggedIn = 'is_logged_in';
  static const _keyUserData = 'user_data';

  static Future<void> saveLogin(Map<String, dynamic> data) async {
    await _storage.write(key: _keyIsLoggedIn, value: 'true');
    await _storage.write(key: _keyUserData, value: data.toString());
  }

  static Future<bool> isLoggedIn() async {
    final value = await _storage.read(key: _keyIsLoggedIn);
    return value == 'true';
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
