import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';
import 'token_manager.dart';

/// Interceptor xử lý attach token + refresh token
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final TokenManager _tokenManager;
  final AuthCubit _authCubit;

  bool _isRefreshing = false;

  // Queue để đặt các request khi đang refresh token
  final List<Function(String)> _waitQueue = [];

  AuthInterceptor({
    required dio,
    required tokenManager,
    required authCubit,
  })  : _dio = dio,
        _tokenManager = tokenManager,
        _authCubit = authCubit;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenManager.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    AppLogger().info("Error connect status: ${err.response?.statusCode}");
    if (err.response?.statusCode == 401) {
      final requestOptions = err.requestOptions;

      // Nếu đang refresh → đưa request vào hàng chờ
      if (_isRefreshing) {
        final completer = Completer<Response>();
        _waitQueue.add((String newToken) async {
          requestOptions.headers['Authorization'] = 'Bearer $newToken';
          completer.complete(await _retry(requestOptions));
        });
        return completer.future.then((res) => handler.resolve(res));
      }

      // Thực hiện refresh
      _isRefreshing = true;
      try {
        final newToken = await _tokenManager.refreshToken();
        if (newToken != null) {
          final response = await _retryWithNewToken(requestOptions, newToken);
          handler.resolve(response);
        } else {
          // Xử lý khi token hết hạn và ko có refresh token
          await _tokenManager.clearTokens();
          _authCubit.logout();
          // TODO: fix it
          // router.go("/login");
          handler.next(err);
        }
      } finally {
        _isRefreshing = false;
      }
      return;
    }

    handler.next(err);
  }

  Future<Response> _retryWithNewToken(
      RequestOptions requestOptions, String token) async {
    requestOptions.headers['Authorization'] = 'Bearer $token';
    final response = await _retry(requestOptions);

    for (final callback in _waitQueue) {
      callback(token);
    }
    _waitQueue.clear();

    return response;
  }

  Future<Response> _retry(RequestOptions requestOptions) {
    return _dio.fetch(
      Options(method: requestOptions.method, headers: requestOptions.headers)
          .compose(
        _dio.options,
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      ),
    );
  }
}
