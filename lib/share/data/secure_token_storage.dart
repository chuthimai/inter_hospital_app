import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage {
  SecureTokenStorage._internal();

  static final SecureTokenStorage _instance = SecureTokenStorage._internal();
  factory SecureTokenStorage() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Key
  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';

  // Ghi token
  Future<void> writeAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<void> writeRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Đọc token
  Future<String?> readAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> readRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Xóa token
  Future<void> deleteTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
