abstract class SendOtpRemoteDataSource {
  Future<void> sendOtp(String otpCode);
}

class SendOtpRemoteDataSourceImpl implements SendOtpRemoteDataSource {
  @override
  Future<void> sendOtp(String otpCode) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

}