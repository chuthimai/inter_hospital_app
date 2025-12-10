import 'package:inter_hospital_app/share/constants/path_api.dart';
import 'package:inter_hospital_app/share/db/secure_token_storage.dart';
import 'package:inter_hospital_app/share/dio/remote_service.dart';
import 'package:inter_hospital_app/share/utils/app_exception/api_error_handler.dart';
import 'package:inter_hospital_app/share/utils/app_exception/api_exception.dart';

import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(LoginRequest loginRequest);

  Future<void> register(RegisterRequest registerRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(LoginRequest loginRequest) async {
    try {
      final remote = RemoteService();
      final response =
          await remote.post(PathApi.login, data: loginRequest.toJson());
      final tokenStorage = SecureTokenStorage();
      await tokenStorage.writeAccessToken(response.data["token"]);
      return UserModel.fromJson(response.data);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      if (error.statusCode == 400) {
        throw ApiException("Sai tài khoản hoặc mật khẩu");
      }
      throw error;
    }
  }

  @override
  Future<void> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
