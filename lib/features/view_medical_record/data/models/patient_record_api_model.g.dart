// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_record_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRecordApiModel _$PatientRecordApiModelFromJson(
        Map<String, dynamic> json) =>
    PatientRecordApiModel(
      identifier: (json['identifier'] as num).toInt(),
      status: json['status'] as bool,
      createdTime: DateTime.parse(json['createdTime'] as String),
      serviceReports: (json['serviceReports'] as List<dynamic>?)
              ?.map((e) =>
                  ServiceReportApiModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      prescription: json['prescription'] == null
          ? null
          : PrescriptionApiModel.fromJson(
              json['prescription'] as Map<String, dynamic>),
      pathUrl: json['pathUrl'] as String?,
    );

Map<String, dynamic> _$PatientRecordApiModelToJson(
        PatientRecordApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'status': instance.status,
      'createdTime': instance.createdTime.toIso8601String(),
      'serviceReports': instance.serviceReports.map((e) => e.toJson()).toList(),
      'prescription': instance.prescription?.toJson(),
      'pathUrl': instance.pathUrl,
    };
