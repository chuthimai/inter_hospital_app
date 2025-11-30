// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_item_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentItemApiModel _$AssessmentItemApiModelFromJson(
        Map<String, dynamic> json) =>
    AssessmentItemApiModel(
      identifier: (json['identifier'] as num).toInt(),
      name: json['name'] as String,
      parentIdentifier: (json['parentIdentifier'] as num?)?.toInt(),
      measurementItem: json['measurementItem'] == null
          ? null
          : MeasurementIndicatorApiModel.fromJson(
              json['measurementItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssessmentItemApiModelToJson(
        AssessmentItemApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'parentIdentifier': instance.parentIdentifier,
      'measurementItem': instance.measurementItem?.toJson(),
    };
