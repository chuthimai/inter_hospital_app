import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<User> call(LoginParams loginParams) {
    return repository.login(loginParams);
  }
}