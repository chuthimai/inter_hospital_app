import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(LoginParams loginParams);
  Future<User?> getCurrentUser();
  Future<void> logout();
}