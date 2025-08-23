import 'package:inter_hospital_app/features/auth/domain/entities/reset_password_params.dart';

abstract class ResetPasswordRepository {
  Future<void> resetPassword(ResetPasswordParams resetPasswordParams);
}