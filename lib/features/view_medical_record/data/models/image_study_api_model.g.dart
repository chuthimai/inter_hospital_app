// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_study_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageStudyApiModel _$ImageStudyApiModelFromJson(Map<String, dynamic> json) =>
    ImageStudyApiModel(
      id: (json['id'] as num).toInt(),
      endpoint: json['endpoint'] as String,
      receivedTime: json['receivedTime'] == null
          ? null
          : DateTime.parse(json['receivedTime'] as String),
    );

Map<String, dynamic> _$ImageStudyApiModelToJson(ImageStudyApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'receivedTime': instance.receivedTime?.toIso8601String(),
    };
