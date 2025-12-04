import '../../domain/entities/medical_record.dart';

abstract class MedicalRecordState {}

class MedicalRecordInitial extends MedicalRecordState {}

class MedicalRecordGetAllSuccess extends MedicalRecordState {
  final List<MedicalRecord> patientRecords;

  MedicalRecordGetAllSuccess(this.patientRecords);
}

class MedicalRecordGetAllFailure extends MedicalRecordState {
  final String message;
  MedicalRecordGetAllFailure(String message)
      : message = message.replaceFirst("Exception: ", "");
}

class MedicalRecordGetDetailSuccess extends MedicalRecordState {
  final MedicalRecord patientRecord;

  MedicalRecordGetDetailSuccess(this.patientRecord);
}

class MedicalRecordGetDetailFailure extends MedicalRecordState {
  final String message;
  MedicalRecordGetDetailFailure(String message)
      : message = message.replaceFirst("Exception: ", "");
}
