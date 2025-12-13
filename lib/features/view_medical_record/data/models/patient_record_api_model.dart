import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/medical_record.dart';
import 'hospital_api_model.dart';

part 'patient_record_api_model.g.dart';

@JsonSerializable()
class PatientRecordApiModel {
  final int identifier;
  final DateTime createdTime;
  final HospitalApiModel hospital;
  final String? link;

  PatientRecordApiModel({
    required this.identifier,
    required this.createdTime,
    required this.hospital,
    this.link,
  });

  factory PatientRecordApiModel.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordApiModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PatientRecordApiModelToJson(this);

  MedicalRecord toEntity() => MedicalRecord(
    id: identifier,
    createdTime: createdTime,
    hospital: hospital.toEntity(),
    pathUrl: link,
  );
}
