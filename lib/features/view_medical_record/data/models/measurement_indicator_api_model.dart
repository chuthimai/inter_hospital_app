import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/measurement_indicator.dart';
import 'assessment_item_api_model.dart';

part 'measurement_indicator_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MeasurementIndicatorApiModel {
  final String type;
  final String unit;
  final double? minimum;
  final double? maximum;

  MeasurementIndicatorApiModel({
    required this.type,
    required this.unit,
    this.minimum,
    this.maximum,
  });

  factory MeasurementIndicatorApiModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementIndicatorApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeasurementIndicatorApiModelToJson(this);

  factory MeasurementIndicatorApiModel.fromEntity(
      MeasurementIndicator entity) {
    return MeasurementIndicatorApiModel(
      type: entity.type,
      unit: entity.unit,
      minimum: entity.minimum,
      maximum: entity.maximum,
    );
  }
}
