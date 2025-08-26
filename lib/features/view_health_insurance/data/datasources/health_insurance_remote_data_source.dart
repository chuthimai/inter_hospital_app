import 'package:inter_hospital_app/fakedata/health_insurance.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/models/health_insurance_model.dart';

abstract class HealthInsuranceRemoteDataSource {
  Future<HealthInsuranceModel?> getRemoteHealthInsurance(int userId);
}

class HealthInsuranceRemoteDataSourceImpl implements HealthInsuranceRemoteDataSource {
  @override
  Future<HealthInsuranceModel?> getRemoteHealthInsurance(int userId) async {
      // await Future.delayed(const Duration(seconds: 2));
      return HealthInsuranceModel.fromJson(healthInsuranceDataFake);
  }
}