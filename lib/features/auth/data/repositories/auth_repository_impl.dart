import 'package:inter_hospital_app/features/notification/data/datasource/notification_local_data_source.dart';
import 'package:inter_hospital_app/features/view_medical_record/data/datasource/medical_record_local_data_source.dart';
import 'package:inter_hospital_app/share/db/secure_token_storage.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/login_params.dart';
import '../../domain/entities/register_params.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NotificationLocalDataSource _notificationLocalDataSource;
  final MedicalRecordLocalDataSource _medicalRecordLocalDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
    required NotificationLocalDataSource notificationLocalDataSource,
    required MedicalRecordLocalDataSource medicalRecordLocalDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _notificationLocalDataSource = notificationLocalDataSource,
        _medicalRecordLocalDataSource = medicalRecordLocalDataSource;

  @override
  Future<User> login(LoginParams loginParams) async {
    try {
      final userModel =
          await _remoteDataSource.login(LoginRequest.fromParams(loginParams));
      await _localDataSource.saveUser(userModel);
      return userModel.toEntity();
    } catch (e) {
      AppLogger().error("Remote error: $e");
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    await _localDataSource.deleteUser();
    await _notificationLocalDataSource.deleteAllNotifications();
    await _medicalRecordLocalDataSource.deleteAllPatientRecords();
    await SecureTokenStorage().deleteTokens();
  }

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await _localDataSource.getUser();
    return userModel?.toEntity();
  }

  @override
  Future<void> register(RegisterParams registerParams) async {
    await _remoteDataSource
        .register(RegisterRequest.fromParams(registerParams));
  }
}
