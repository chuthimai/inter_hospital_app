// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_contract_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartContractApiModel _$SmartContractApiModelFromJson(
        Map<String, dynamic> json) =>
    SmartContractApiModel(
      id: (json['id'] as num).toInt(),
      key: json['key'] as String,
      permission: json['permission'] as String,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validTo: DateTime.parse(json['validTo'] as String),
      subject:
          HospitalApiModel.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SmartContractApiModelToJson(
        SmartContractApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'permission': instance.permission,
      'validFrom': instance.validFrom.toIso8601String(),
      'validTo': instance.validTo.toIso8601String(),
      'subject': instance.subject,
    };
