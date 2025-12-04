import 'package:inter_hospital_app/share/utils/app_logger.dart';
import 'package:inter_hospital_app/share/utils/pdf_file_manager.dart';

import '../../domain/entities/medical_record.dart';
import '../../domain/repositories/medical_record_repository.dart';
import '../datasource/medical_record_local_data_source.dart';
import '../datasource/medical_record_remote_data_source.dart';
import '../models/patient_record_db_model.dart';

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
  Future<List<MedicalRecord>> getAllPatientRecords() async {
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
  Future<void> savePatientRecord(MedicalRecord patientRecord) async {
    if (patientRecord.pathUrl == null) return;
    try {
      final pathFilePdf = await PdfFileManager.downloadPdf(
        patientRecord.pathUrl!,
        "BA${patientRecord.id}_${patientRecord.hospital.id}",
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

  @override
  Future<MedicalRecord?> getDetailPatientRecord(MedicalRecord patientRecord) {
    // TODO: implement getDetailPatientRecord
    throw UnimplementedError();
  }
}
