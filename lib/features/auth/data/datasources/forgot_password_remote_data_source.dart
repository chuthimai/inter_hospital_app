import 'package:inter_hospital_app/features/auth/domain/entities/forgot_password_params.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams);
}

class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  @override
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

}