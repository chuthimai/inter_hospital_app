import '../../domain/entities/hospital.dart';

abstract class HospitalState {}

class HospitalInitial implements HospitalState {}

class HospitalLoading implements HospitalState {}

class HospitalSuccess implements HospitalState {
  final List<Hospital> hospitals;
  HospitalSuccess(this.hospitals);
}
