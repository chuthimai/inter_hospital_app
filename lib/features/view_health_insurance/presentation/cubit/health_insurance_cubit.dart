import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/view_health_insurance/domain/repositories/health_insurance_repository.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/cubit/health_insurance_state.dart';

class HealthInsuranceCubit extends Cubit<HealthInsuranceState> {
  final HealthInsuranceRepository repo;

  HealthInsuranceCubit(this.repo)
      : super(HealthInsuranceLoading());

  Future<void> getHealthInsurance(int userId) async {
    emit(HealthInsuranceLoading());
    final healthInsurance = await repo.getHealthInsurance(userId);
    if (healthInsurance == null) emit(HealthInsuranceFailure());
    else emit(HealthInsuranceSuccess(healthInsurance));
  }
}
