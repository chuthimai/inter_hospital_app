import 'package:inter_hospital_app/features/auth/domain/entities/forgot_password_params.dart';

import '../repositories/auth_repository.dart';

class ForgotPassword {
  final AuthRepository repository;

  ForgotPassword(this.repository);

  Future<void> call(ForgotPasswordParams forgotPasswordParams) {
    return repository.forgotPassword(forgotPasswordParams);
  }
}