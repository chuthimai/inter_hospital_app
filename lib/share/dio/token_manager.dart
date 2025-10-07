import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inter_hospital_app/share/db/secure_token_storage.dart';

/// Quản lý token (lưu trữ, refresh)
class TokenManager {
  final SecureTokenStorage _storage;
  final Dio _dio;

  TokenManager(this._storage, this._dio);

  Future<String?> getAccessToken() => _storage.readAccessToken();
  Future<void> saveAccessToken(String token) => _storage.writeAccessToken(token);

  Future<String?> getRefreshToken() => _storage.readRefreshToken();
  Future<void> saveRefreshToken(String token) => _storage.writeRefreshToken(token);

  Future<void> clearTokens() => _storage.deleteTokens();

  /// Gọi API refresh token
  Future<String?> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final resp = await _dio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      if (resp.statusCode == 200) {
        final data = resp.data;
        final newAccess = data['access_token'] as String?;
        final newRefresh = data['refresh_token'] as String?;

        if (newAccess != null) {
          await saveAccessToken(newAccess);
          if (newRefresh != null) {
            await saveRefreshToken(newRefresh);
          }
          return newAccess;
        }
      }
    } catch (_) {}

    return null;
  }
}