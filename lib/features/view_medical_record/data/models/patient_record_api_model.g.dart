// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_record_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRecordApiModel _$PatientRecordApiModelFromJson(
        Map<String, dynamic> json) =>
    PatientRecordApiModel(
      identifier: (json['identifier'] as num).toInt(),
      createdTime: DateTime.parse(json['createdTime'] as String),
      hospital:
          HospitalApiModel.fromJson(json['hospital'] as Map<String, dynamic>),
      link: json['link'] as String?,
    );

Map<String, dynamic> _$PatientRecordApiModelToJson(
        PatientRecordApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'createdTime': instance.createdTime.toIso8601String(),
      'hospital': instance.hospital,
      'link': instance.link,
    };
