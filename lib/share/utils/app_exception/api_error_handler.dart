import 'dart:io';

import 'package:dio/dio.dart';

import 'api_exception.dart';

class ApiErrorHandler {
  static ApiException handle(dynamic error) {
    if (error is DioException) {
      // Lỗi do Dio (thư viện gọi API)
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiException("Kết nối hết hạn, vui lòng thử lại sau.");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final data = error.response?.data;
          String message = "Đã xảy ra lỗi không xác định.";

          if (data is Map && data["message"] != null) {
            final msg = data["message"];

            if (msg is String) {
              message = msg;
            } else if (msg is List) {
              message = msg.join(", ");
            } else {
              message = msg.toString();
            }
          } else {
            switch (statusCode) {
              case 400:
                message = "Yêu cầu không hợp lệ.";
                break;
              case 401:
                message = "Bạn chưa đăng nhập hoặc phiên đã hết hạn.";
                break;
              case 403:
                message = "Bạn không có quyền truy cập.";
                break;
              case 404:
                message = "Không tìm thấy tài nguyên.";
                break;
              case 500:
                message = "Lỗi server, vui lòng thử lại sau.";
                break;
              default:
                message = "Lỗi hệ thống (${statusCode ?? 'Unknown'}).";
            }
          }
          return ApiException(message, statusCode: statusCode);

        case DioExceptionType.cancel:
          return ApiException("Yêu cầu đã bị hủy.");

        case DioExceptionType.unknown:
        default:
          if (error.error is SocketException) {
            return ApiException("Không có kết nối Internet.");
          }
          return ApiException("Đã xảy ra lỗi không xác định.");
      }
    } else {
      // Lỗi ngoài dự kiến
      return ApiException("Đã xảy ra lỗi không mong đợi: $error");
    }
  }
}
