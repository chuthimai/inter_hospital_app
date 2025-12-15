import '../entities/medical_record.dart';

abstract class MedicalRecordRepository {
  Future<List<MedicalRecord>> getAllPatientRecords();  // api + local
  Future<MedicalRecord?> getDetailPatientRecord(MedicalRecord patientRecord);  // api + local
  // Chỉ lưu patientRecord đã đóng
  Future<MedicalRecord?> savePatientRecord(MedicalRecord patientRecord);  // local
  Future<void> deleteAllPatientRecords();  // local
}