import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';

import '../../domain/entities/hospital.dart';
import '../../domain/repositories/permission_repository.dart';
import 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState>{
  final PermissionRepository _repo;
  PermissionCubit(this._repo): super(PermissionInitial());

  Future<void> getAllPermissions(User user) async {
    emit(PermissionLoading());
    final permissions = await _repo.getAllPermissions(user);
    emit(PermissionGetAllSuccess(permissions));
  }

  Future<void> createPermission(Hospital hospital) async {
    emit(PermissionInitial());
    try {
      emit(PermissionLoading());
      await _repo.createPermission(hospital);
      emit(PermissionCreatedSuccess());
    } catch(e){
      emit(PermissionCreatedFailure(e.toString()));
    }
  }

  void setInit() {
    emit(PermissionInitial());
  }
}