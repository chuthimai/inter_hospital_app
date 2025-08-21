import 'package:inter_hospital_app/features/auth/domain/entities/reset_password_params.dart';

import '../repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository repository;

  ResetPassword(this.repository);

  Future<void> call(ResetPasswordParams resetPasswordParams) => repository.resetPassword(resetPasswordParams);
}
