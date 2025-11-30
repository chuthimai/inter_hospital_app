// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaging_report_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagingReportApiModel _$ImagingReportApiModelFromJson(
        Map<String, dynamic> json) =>
    ImagingReportApiModel(
      focus: json['focus'] as String,
      imageStudies: (json['imageStudies'] as List<dynamic>?)
              ?.map(
                  (e) => ImageStudyApiModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      interpretation: json['interpretation'] as String,
    );

Map<String, dynamic> _$ImagingReportApiModelToJson(
        ImagingReportApiModel instance) =>
    <String, dynamic>{
      'focus': instance.focus,
      'imageStudies': instance.imageStudies.map((e) => e.toJson()).toList(),
      'interpretation': instance.interpretation,
    };
