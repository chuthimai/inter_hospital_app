import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:inter_hospital_app/share/db/isar_service.dart';
import 'package:isar/isar.dart';

import '../models/patient_record_db_model.dart';

abstract class MedicalRecordLocalDataSource {
  Future<List<PatientRecordDbModel>> getAllPatientRecords();
  Future<PatientRecordDbModel?> getDetailPatientRecord(PatientRecordDbModel patientRecord);
  Future<void> savePatientRecord(PatientRecordDbModel patientRecord);
  Future<void> deleteAllPatientRecords();
}

class MedicalRecordLocalDataSourceImpl implements MedicalRecordLocalDataSource {
  Future<Isar> get _isar async => await IsarService.instance;

  @override
  Future<List<PatientRecordDbModel>> getAllPatientRecords() async {
    final isar = await _isar;
    return await isar.patientRecordDbModels.where().findAll();
  }

  @override
  Future<PatientRecordDbModel?> getDetailPatientRecord(
      PatientRecordDbModel patientRecord) async {
    final isar = await _isar;
    return await isar.patientRecordDbModels.get(patientRecord.id);
  }

  @override
  Future<void> savePatientRecord(PatientRecordDbModel patientRecord) async {
    final isar = await _isar;

    await isar.writeTxn(() async {
      if (patientRecord.hospital.value != null) {
        await isar.hospitalDbModels.put(patientRecord.hospital.value!);
      }
      await isar.patientRecordDbModels.put(patientRecord);
      await patientRecord.hospital.save();
    });
  }

  @override
  Future<void> deleteAllPatientRecords() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.patientRecordDbModels.clear();
    });
  }
}
