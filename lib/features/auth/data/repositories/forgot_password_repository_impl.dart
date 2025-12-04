import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/forgot_password_params.dart';
import '../../domain/repositories/forgot_password_repository.dart';
import '../datasources/forgot_password_remote_data_source.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams) async {
    try {
      await _remoteDataSource.forgotPassword(forgotPasswordParams);
    } catch (e) {
      AppLogger().error("Remote error: $e");
      throw Exception("Kết nối không ổn định");
    }
  }

}