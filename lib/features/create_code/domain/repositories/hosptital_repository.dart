import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';

abstract class HospitalRepository {
  Future<List<Hospital>> getAllHospital();
  Future<void> deleteLocalAllHospital();
}