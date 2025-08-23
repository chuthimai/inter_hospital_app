import 'package:inter_hospital_app/features/view_health_insurance/domain/entities/health_insurance.dart';

abstract class HealthInsuranceRepository {
  Future<HealthInsurance?> getHealthInsurance(int userId);
}