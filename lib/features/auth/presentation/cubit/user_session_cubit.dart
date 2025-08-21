import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';

class UserSessionCubit extends Cubit<User?> {
  UserSessionCubit() : super(null);

  void saveUser(User user) => emit(user);
  void clearUser() => emit(null);
}