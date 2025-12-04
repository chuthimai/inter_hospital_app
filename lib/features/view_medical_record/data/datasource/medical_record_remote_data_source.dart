
import 'package:inter_hospital_app/share/constants/path_api.dart';
import 'package:inter_hospital_app/share/dio/remote_service.dart';
import 'package:inter_hospital_app/share/utils/app_exception/api_error_handler.dart';

import '../models/patient_record_api_model.dart';

abstract class MedicalRecordRemoteDataSource {
  Future<List<PatientRecordApiModel>> getAllPatientRecords();

  Future<PatientRecordApiModel> getDetailPatientRecord(
      PatientRecordApiModel patientRecord);
}

class MedicalRecordRemoteDataSourceImpl
    implements MedicalRecordRemoteDataSource {
  @override
  Future<List<PatientRecordApiModel>> getAllPatientRecords() async {
    try {
      final remote = RemoteService();
      final response = await remote.get(PathApi.getAllMedicalRecord);

      final data = response.data as List<dynamic>;
      final medicalReports = data
          .map((json) =>
              PatientRecordApiModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return medicalReports;
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      throw error;
    }
  }

  @override
  Future<PatientRecordApiModel> getDetailPatientRecord(
      PatientRecordApiModel patientRecord) async {
    try {
      final remote = RemoteService();
      final response = await remote.get(
          PathApi.getDetailMedicalRecord + patientRecord.identifier.toString());

      final data = response.data as Map<String, dynamic>;
      return PatientRecordApiModel.fromJson(data);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      throw error;
    }
  }
}
