import '../entities/reset_password_params.dart';

abstract class ResetPasswordRepository {
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams);
}