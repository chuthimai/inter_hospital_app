import 'package:inter_hospital_app/fakedata/users.dart';
import 'package:inter_hospital_app/features/auth/data/models/forgot_password_request.dart';
import 'package:inter_hospital_app/features/auth/data/models/login_request.dart';
import 'package:inter_hospital_app/features/auth/data/models/reset_password_request.dart';
import 'package:inter_hospital_app/share/constants/api.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(LoginRequest loginRequest);

  Future<void> resetPassword(ResetPasswordRequest resetPasswordRequest);

  Future<void> forgotPassword(ForgotPasswordRequest forgotPasswordRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(LoginRequest loginRequest) async {
    try {
      // Gọi API thật
      // final response = await dio.post('/auth/login', data: loginRequest.toJson());
      // return UserModel.fromJson(response.data['user'] as Map<String, dynamic>);

      // Fake API delay
      await Future.delayed(const Duration(seconds: 2));

      if (loginRequest.id == 1 && loginRequest.password == "12345678") {
        return UserModel.fromJson(userDataFake);
      }

      throw Exception("Sai số CCCD hoặc mật khẩu");
    } catch (e) {
      rethrow; // ném lỗi cho tầng trên xử lý
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    //TODO: Ở đây khi gửi id lên server sẽ trả về đã xác thực sau đó sẽ hiện form điền mật khẩu
    // await dio.post('/auth/reset-password', data: resetPasswordRequest.toJson());
  }

  @override
  Future<void> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    //TODO: Ở đây khi gửi id lên server sẽ trả về đã xác thực sau đó sẽ hiện form điền mật khẩu
    // await dio.post('/auth/reset-password', data: forgotPasswordRequest.toJson());
  }
}
