
import 'package:inter_hospital_app/features/view_health_insurance/domain/entities/health_insurance.dart';

abstract class HealthInsuranceState {}

class HealthInsuranceLoading implements HealthInsuranceState {}

class HealthInsuranceSuccess implements HealthInsuranceState {
  final HealthInsurance healthInsurance;

  HealthInsuranceSuccess(this.healthInsurance);
}

class HealthInsuranceFailure implements HealthInsuranceState {}