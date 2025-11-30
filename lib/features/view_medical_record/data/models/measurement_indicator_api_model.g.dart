// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_indicator_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementIndicatorApiModel _$MeasurementIndicatorApiModelFromJson(
        Map<String, dynamic> json) =>
    MeasurementIndicatorApiModel(
      type: json['type'] as String,
      unit: json['unit'] as String,
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MeasurementIndicatorApiModelToJson(
        MeasurementIndicatorApiModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'unit': instance.unit,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };
