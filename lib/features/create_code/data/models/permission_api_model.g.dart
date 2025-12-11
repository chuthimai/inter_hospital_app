// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionApiModel _$PermissionApiModelFromJson(Map<String, dynamic> json) =>
    PermissionApiModel(
      identifier: (json['identifier'] as num).toInt(),
      type: json['type'] as String,
      expiredTime: DateTime.parse(json['expiredTime'] as String),
      hospitalIdentifier: (json['hospitalIdentifier'] as num).toInt(),
      userIdentifier: json['userIdentifier'] as String,
    );

Map<String, dynamic> _$PermissionApiModelToJson(PermissionApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'type': instance.type,
      'expiredTime': instance.expiredTime.toIso8601String(),
      'hospitalIdentifier': instance.hospitalIdentifier,
      'userIdentifier': instance.userIdentifier,
    };
