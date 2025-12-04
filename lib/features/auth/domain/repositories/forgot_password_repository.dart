import '../entities/forgot_password_params.dart';

abstract class ForgotPasswordRepository {
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams);
}