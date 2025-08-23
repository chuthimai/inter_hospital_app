// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_insurance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthInsuranceModel _$HealthInsuranceModelFromJson(
        Map<String, dynamic> json) =>
    HealthInsuranceModel(
      id: (json['id'] as num).toInt(),
      objectType: json['objectType'] as String,
      effectiveDate: DateTime.parse(json['effectiveDate'] as String),
      expiredDate: DateTime.parse(json['expiredDate'] as String),
      registeredHospital: json['registeredHospital'] as String,
      lastUpdateTime: json['lastUpdateTime'] == null
          ? null
          : DateTime.parse(json['lastUpdateTime'] as String),
    );

Map<String, dynamic> _$HealthInsuranceModelToJson(
        HealthInsuranceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectType': instance.objectType,
      'effectiveDate': instance.effectiveDate.toIso8601String(),
      'expiredDate': instance.expiredDate.toIso8601String(),
      'registeredHospital': instance.registeredHospital,
      'lastUpdateTime': instance.lastUpdateTime?.toIso8601String(),
    };
