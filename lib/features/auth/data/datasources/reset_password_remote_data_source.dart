import '../../domain/entities/reset_password_params.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams);
}

class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  @override
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

}