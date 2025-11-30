// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_result_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentResultApiModel _$AssessmentResultApiModelFromJson(
        Map<String, dynamic> json) =>
    AssessmentResultApiModel(
      identifier: (json['identifier'] as num).toInt(),
      value: json['value'] as String,
      assessmentItemIdentifier:
          (json['assessmentItemIdentifier'] as num).toInt(),
    );

Map<String, dynamic> _$AssessmentResultApiModelToJson(
        AssessmentResultApiModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'value': instance.value,
      'assessmentItemIdentifier': instance.assessmentItemIdentifier,
    };
