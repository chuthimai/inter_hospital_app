import 'package:inter_hospital_app/features/auth/data/datasources/auth_local_data_source.dart';
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
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> login(LoginParams loginParams) async {
    final userModel =
        await remoteDataSource.login(LoginRequest.fromParams(loginParams));
    await localDataSource.saveUser(userModel);
    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await localDataSource.deleteUser();
  }

  @override
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams) async {
    await remoteDataSource
        .resetPassword(ResetPasswordRequest.fromParams(resetPasswordParams));
  }

  @override
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams) async {
    await remoteDataSource
        .forgotPassword(ForgotPasswordRequest.fromParams(forgotPasswordParams));
  }

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await localDataSource.getUser();
    return userModel?.toEntity();
  }
}
