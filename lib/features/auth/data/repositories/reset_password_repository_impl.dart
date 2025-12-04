import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/reset_password_params.dart';
import '../../domain/repositories/reset_password_repository.dart';
import '../datasources/reset_password_remote_data_source.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource _remoteDataSource;

  ResetPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams) async {
    try {
      await _remoteDataSource.resetPassword(resetPasswordParams);
    } catch (e) {
      AppLogger().error("Remote error: $e");
      throw Exception("Kết nối không ổn định");
    }
  }

}