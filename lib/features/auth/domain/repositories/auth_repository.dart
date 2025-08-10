import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String id, String password);
  Future<User> register(String id);
  Future<void> logout();
  Future<void> resetPassword(String id);
  Future<void> forgotPassword(String id);
}