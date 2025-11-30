// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_report_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceReportApiModel _$ServiceReportApiModelFromJson(
        Map<String, dynamic> json) =>
    ServiceReportApiModel(
      identifier: (json['identifier'] as num).toInt(),
      category: json['category'] as String,
      method: json['method'] as String,
      status: json['status'] as bool,
      effectiveTime: json['effectiveTime'] == null
          ? null
          : DateTime.parse(json['effectiveTime'] as String),
      service:
          ServiceApiModel.fromJson(json['service'] as Map<String, dynamic>),
      performer: json['performer'] == null
          ? null
          : PhysicianApiModel.fromJson(
              json['performer'] as Map<String, dynamic>),
      assessmentResults: (json['assessmentResults'] as List<dynamic>?)
              ?.map((e) =>
                  AssessmentResultApiModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      diagnosisReport: json['diagnosisReport'] == null
          ? null
          : DiagnosisReportApiModel.fromJson(
              json['diagnosisReport'] as Map<String, dynamic>),
      imagingReport: json['imagingReport'] == null
          ? null
          : ImagingReportApiModel.fromJson(
              json['imagingReport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceReportApiModelToJson(
        ServiceReportApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'category': instance.category,
      'method': instance.method,
      'status': instance.status,
      'effectiveTime': instance.effectiveTime?.toIso8601String(),
      'service': instance.service.toJson(),
      'performer': instance.performer?.toJson(),
      'assessmentResults':
          instance.assessmentResults.map((e) => e.toJson()).toList(),
      'diagnosisReport': instance.diagnosisReport?.toJson(),
      'imagingReport': instance.imagingReport?.toJson(),
    };
