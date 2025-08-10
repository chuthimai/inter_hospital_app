import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<User> login(String id, String password) async {
    final userModel = await remoteDatasource.login(id, password);
    return userModel;
  }

  @override
  Future<void> logout() async {
    await remoteDatasource.logout();
  }

  @override
  Future<User> register(String id) async {
    final userModel = await remoteDatasource.register(id);
    return userModel;
  }

  @override
  Future<void> resetPassword(String id) async {
    await remoteDatasource.resetPassword(id);
  }

  @override
  Future<void> forgotPassword(String id) async {
    await remoteDatasource.forgotPassword(id);
  }
  
}