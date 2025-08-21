import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';
import 'package:inter_hospital_app/features/auth/domain/repositories/auth_repository.dart';

import 'auth_state.dart';
import 'user_session_cubit.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  final UserSessionCubit userSession;

  AuthCubit(this.repo, this.userSession) : super(AuthInitial());

  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    final user = await repo.getCurrentUser();
    if (user != null) {
      emit(AuthSuccess(user));
      return;
    }
    emit(AuthInitial());
  }

  Future<void> login(LoginParams loginParams) async {
    emit(AuthLoading());

    try {
      final user = await repo.login(loginParams);
      userSession.saveUser(user);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void logout() {
    repo.logout();
    userSession.clearUser();
    emit(AuthInitial());
  }
}