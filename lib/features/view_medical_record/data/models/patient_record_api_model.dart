import 'package:hospital_app/features/view_medical_record/domain/entities/enum/record_status.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../view_prescription/data/models/prescription_api_model.dart';
import '../../domain/entities/patient_record.dart';
import 'service_report_api_model.dart';

part 'patient_record_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PatientRecordApiModel {
  final int identifier;
  final bool status;
  final DateTime createdTime;
  final List<ServiceReportApiModel> serviceReports;
  final PrescriptionApiModel? prescription;
  final String? pathUrl;

  PatientRecordApiModel({
    required this.identifier,
    required this.status,
    required this.createdTime,
    this.serviceReports = const [],
    this.prescription,
    this.pathUrl,
  });

  factory PatientRecordApiModel.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRecordApiModelToJson(this);

  /// API → Domain
  PatientRecord toEntity() => PatientRecord(
    id: identifier,
    status: status ? RecordStatus.complete : RecordStatus.incomplete,
    createdTime: createdTime,
    serviceReports: serviceReports.map((r) => r.toEntity()).toList(),
    prescription: prescription?.toEntity(),
    pathUrl: pathUrl,
  );

  /// Domain → API
  factory PatientRecordApiModel.fromEntity(PatientRecord entity) =>
      PatientRecordApiModel(
        identifier: entity.id,
        status: entity.status == RecordStatus.complete,
        createdTime: entity.createdTime,
        prescription: entity.prescription != null
            ? PrescriptionApiModel.fromEntity(entity.prescription!)
            : null,
        pathUrl: entity.pathUrl,
      );
}
