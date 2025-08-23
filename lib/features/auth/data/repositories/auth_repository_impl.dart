import 'package:inter_hospital_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/models/login_request.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource, _remoteDataSource = remoteDataSource;

  @override
  Future<User> login(LoginParams loginParams) async {
    final userModel =
        await _remoteDataSource.login(LoginRequest.fromParams(loginParams));
    await _localDataSource.saveUser(userModel);
    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await _localDataSource.deleteUser();
  }

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await _localDataSource.getUser();
    return userModel?.toEntity();
  }
}
