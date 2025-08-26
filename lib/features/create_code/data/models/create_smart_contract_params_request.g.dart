// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_smart_contract_params_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSmartContractParamsRequest _$CreateSmartContractParamsRequestFromJson(
        Map<String, dynamic> json) =>
    CreateSmartContractParamsRequest(
      permission: json['permission'] as String,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validTo: DateTime.parse(json['validTo'] as String),
      subjectId: (json['subjectId'] as num).toInt(),
      grantedBy: (json['grantedBy'] as num).toInt(),
    );

Map<String, dynamic> _$CreateSmartContractParamsRequestToJson(
        CreateSmartContractParamsRequest instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'validFrom': instance.validFrom.toIso8601String(),
      'validTo': instance.validTo.toIso8601String(),
      'subjectId': instance.subjectId,
      'grantedBy': instance.grantedBy,
    };
