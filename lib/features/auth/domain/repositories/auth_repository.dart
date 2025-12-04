import '../entities/login_params.dart';
import '../entities/register_params.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(LoginParams loginParams);
  Future<User?> getCurrentUser();
  Future<void> logout();
  Future<void> register(RegisterParams registerParams);
}