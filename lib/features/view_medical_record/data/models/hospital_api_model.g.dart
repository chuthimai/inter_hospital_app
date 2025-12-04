// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalApiModel _$HospitalApiModelFromJson(Map<String, dynamic> json) =>
    HospitalApiModel(
      identifier: (json['identifier'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$HospitalApiModelToJson(HospitalApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
    };
