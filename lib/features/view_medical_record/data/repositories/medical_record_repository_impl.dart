import 'package:hospital_app/features/view_medical_record/data/models/patient_record_db_model.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/enum/record_status.dart';
import 'package:hospital_app/share/utils/app_logger.dart';
import 'package:hospital_app/share/utils/pdf_file_manager.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/patient_record.dart';
import '../../domain/repositories/medical_record_repository.dart';
import '../datasource/medical_record_local_data_source.dart';
import '../datasource/medical_record_remote_data_source.dart';
import '../models/patient_record_api_model.dart';

class MedicalRecordRepositoryImpl implements MedicalRecordRepository {
  final MedicalRecordLocalDataSource _localDataSource;
  final MedicalRecordRemoteDataSource _remoteDataSource;

  MedicalRecordRepositoryImpl({
    required localDataSource,
    required remoteDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<void> deleteAllPatientRecords() async {
    try {
      await _localDataSource.deleteAllPatientRecords();
    } catch (e) {
      AppLogger().error("Local error: $e");
    }
  }

  @override
  Future<List<PatientRecord>> getAllPatientRecords() async {
    try {
      final patientRecordsRemote =
          await _remoteDataSource.getAllPatientRecords();
      return patientRecordsRemote.map((e) => e.toEntity()).toList();
    } catch (e) {
      AppLogger().error("Remote error: $e");
    }

    try {
      final patientRecordsLocal = await _localDataSource.getAllPatientRecords();
      return await Future.wait(
          patientRecordsLocal.map((e) => e.toEntity()).toList());
    } catch (e) {
      AppLogger().error("Local error: $e");
    }
    return [];
  }

  @override
  Future<PatientRecord?> getDetailPatientRecord(
      PatientRecord patientRecord) async {
    try {
      final patientRecordLocal = await _localDataSource.getDetailPatientRecord(
          PatientRecordDbModel.fromEntity(patientRecord));
      if (patientRecordLocal != null) return patientRecordLocal.toEntity();
    } catch (e) {
      AppLogger().error("Local error: $e");
    }

    try {
      final patientRecordRemote =
          await _remoteDataSource.getDetailPatientRecord(
              PatientRecordApiModel.fromEntity(patientRecord));
      await savePatientRecord(patientRecord);
      return patientRecordRemote.toEntity();
    } catch (e) {
      AppLogger().error("Remote/Local error: $e");
      rethrow;
    }
  }

  @override
  Future<void> savePatientRecord(PatientRecord patientRecord) async {
    if (patientRecord.status != RecordStatus.complete) return;
    if (patientRecord.pathUrl == null) return;
    try {
      final pathFilePdf = await PdfFileManager.downloadPdf(
        patientRecord.pathUrl!,
        "BA${patientRecord.id}",
      );

      patientRecord.pathFilePdf = pathFilePdf;
      await _localDataSource
          .savePatientRecord(PatientRecordDbModel.fromEntity(patientRecord));
    } catch (e) {
      AppLogger().error("Local error: $e");
      if (e.toString().contains("Error downloading PDF")) {
        throw Exception("Tải file thất bại");
      }
    }
  }
}
