import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/medical_record.dart';
import '../../domain/repositories/medical_record_repository.dart';
import 'medical_record_state.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  final MedicalRecordRepository _repo;

  MedicalRecordCubit(this._repo) : super(MedicalRecordInitial());

  Future<void> getAllPatientRecords() async {
    emit(MedicalRecordInitial());
    try {
      final patientRecords = await _repo.getAllPatientRecords();
      patientRecords.sort();
      emit(MedicalRecordGetAllSuccess(patientRecords));
    } catch (e) {
      emit(MedicalRecordGetAllFailure(e.toString()));
    }
  }

  Future<void> getDetailPatientRecord(MedicalRecord patientRecord) async {
    emit(MedicalRecordInitial());
    try {
      final newPatientRecord =
          await _repo.getDetailPatientRecord(patientRecord);
      if (newPatientRecord != null) {
        emit(MedicalRecordGetDetailSuccess(newPatientRecord));
        return;
      }
      emit(MedicalRecordGetDetailFailure("Không có dữ liệu"));
    } catch (e) {
      emit(MedicalRecordGetDetailFailure(e.toString()));
    }
  }
}
