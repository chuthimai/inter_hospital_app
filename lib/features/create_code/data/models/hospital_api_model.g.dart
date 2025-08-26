// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalApiModel _$HospitalApiModelFromJson(Map<String, dynamic> json) =>
    HospitalApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$HospitalApiModelToJson(HospitalApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
