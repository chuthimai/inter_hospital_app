import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/share/db/secure_token_storage.dart';

import '../constants/app_config.dart';
import 'auth_interceptor.dart';
import 'token_manager.dart';

/***
    Cách dùng:
    final _remote = RemoteService();
    final response = await _remote.post("/users", data: data);
 */

///

class RemoteService {
  static RemoteService? _instance;

  final Dio _dio;
  final TokenManager _tokenManager;
  final AuthCubit _authCubit;

  factory RemoteService({AuthCubit? authCubit}) {
    if (_instance == null) {
      if (authCubit == null) {
        throw Exception(
            "RemoteService chưa được khởi tạo. Phải truyền authCubit lần đầu!");
      }
      _instance = RemoteService._internal(authCubit);
    }
    return _instance!;
  }

  RemoteService._internal(this._authCubit)
      : _dio = Dio(BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          headers: {"Accept": "application/json"},
        )),
        // Dio riêng cho refresh token
        _tokenManager = TokenManager(
          SecureTokenStorage(),
          Dio(BaseOptions(baseUrl: AppConfig.baseUrl)),
        ) {

    // TODO:️ bypass SSL self-signed (DEV only)
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    // Logging (chỉ khi debug)
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
      ));
    }

    // Thêm AuthInterceptor
    _dio.interceptors.add(AuthInterceptor(
      dio: _dio,
      tokenManager: _tokenManager,
      authCubit: _authCubit,
    ));
  }

  Dio get dio => _dio;

  // ------------------ Wrapper GET/POST/PUT/DELETE ------------------
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.get<T>(path,
          queryParameters: queryParameters,
          options: options,
          data: data,
          cancelToken: cancelToken);

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.put<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.delete<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
}
