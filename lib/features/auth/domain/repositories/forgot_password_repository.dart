import 'package:inter_hospital_app/features/auth/domain/entities/forgot_password_params.dart';

abstract class ForgotPasswordRepository {
  Future<void> forgotPassword(ForgotPasswordParams forgotPasswordParams);
}