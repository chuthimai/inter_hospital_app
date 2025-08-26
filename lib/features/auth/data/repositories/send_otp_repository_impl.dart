import 'package:inter_hospital_app/features/auth/data/datasources/send_otp_remote_data_source.dart';
import 'package:inter_hospital_app/features/auth/domain/repositories/send_otp_repository.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

class SendOtpRepositoryImpl implements SendOtpRepository {
  final SendOtpRemoteDataSource _remoteDataSource;

  SendOtpRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> sendOtp(String otpCode) async {
    try {
      await _remoteDataSource.sendOtp(otpCode);
    } catch(e) {
      AppLogger().error("Remote error: $e");
      throw Exception("Kết nối không ổn định");
    }
  }

}