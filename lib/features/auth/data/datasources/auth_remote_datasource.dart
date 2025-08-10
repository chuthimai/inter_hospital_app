import 'package:dio/dio.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(String id, String password);
  Future<UserModel> register(String id);
  Future<void> logout();
  Future<void> resetPassword(String id);
  Future<void> forgotPassword(String id);

}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String id, String password) async {
    final response = await dio.post('/auth/login', data: {
      'identifier': id,
      'password': password,
    });

    return UserModel.fromJson(response.data['user']);
  }

  @override
  Future<UserModel> register(String id) async {
    //TODO: Ở đây khi gửi id lên server sẽ trả về đã xác thực sau đó sẽ hiện form điền mật khẩu
    final response = await dio.post('/auth/register', data: {
      'identifier': id,
    });

    return UserModel.fromJson(response.data['user']);
  }

  @override
  Future<void> logout() async {
    await dio.post('/auth/logout');
  }

  @override
  Future<void> resetPassword(String id) async {
    //TODO: Ở đây khi gửi id lên server sẽ trả về đã xác thực sau đó sẽ hiện form điền mật khẩu
    await dio.post('/auth/reset-password', data: {'identifier': id});
  }

  @override
  Future<void> forgotPassword(String id) async {
    //TODO: Ở đây khi gửi id lên server sẽ trả về đã xác thực sau đó sẽ hiện form điền mật khẩu
    await dio.post('/auth/reset-password', data: {'identifier': id});
  }
}
