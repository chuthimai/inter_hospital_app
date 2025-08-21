import 'package:inter_hospital_app/features/auth/data/models/forgot_password_request.dart';
import 'package:inter_hospital_app/features/auth/data/models/login_request.dart';
import 'package:inter_hospital_app/features/auth/data/models/reset_password_request.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/reset_password_params.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<User> login(LoginParams loginParams) async {
    final userModel =
        await remoteDatasource.login(LoginRequest.fromParams(loginParams));
    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await remoteDatasource.logout();
  }

  @override
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams) async {
    await remoteDatasource
        .resetPassword(ResetPasswordRequest.fromParams(resetPasswordParams));
  }

  @override
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams) async {
    await remoteDatasource
        .forgotPassword(ForgotPasswordRequest.fromParams(forgotPasswordParams));
  }

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
