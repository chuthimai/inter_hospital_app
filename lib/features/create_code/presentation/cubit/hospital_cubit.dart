import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_state.dart';

import '../../domain/repositories/hosptital_repository.dart';

class HospitalCubit extends Cubit<HospitalState> {
  final HospitalRepository repo;

  HospitalCubit(this.repo) : super(HospitalInitial());

  Future<void> getAllHospitals() async {
    // TODO: delete after test
    // await repo.deleteLocalAllHospital();
    emit(HospitalLoading());
    final hospitals = await repo.getAllHospital();
    emit(HospitalSuccess(hospitals));
  }
}
