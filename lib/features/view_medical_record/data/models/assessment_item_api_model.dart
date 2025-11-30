import 'package:hospital_app/features/view_medical_record/domain/entities/assessment_result.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/measurement_indicator.dart';
import 'measurement_indicator_api_model.dart';

part 'assessment_item_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AssessmentItemApiModel {
  final int identifier;
  final String name;
  final int? parentIdentifier;
  final MeasurementIndicatorApiModel? measurementItem;

  AssessmentItemApiModel({
    required this.identifier,
    required this.name,
    this.parentIdentifier,
    this.measurementItem,
  });

  factory AssessmentItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentItemApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentItemApiModelToJson(this);

  AssessmentResult toEntity() {
    if (measurementItem != null) {
      return MeasurementIndicator(
        id: identifier,
        name: name,
        type: measurementItem!.type,
        unit: measurementItem!.unit,
        minimum: measurementItem!.minimum,
        maximum: measurementItem!.maximum,
      );
    }

    return AssessmentResult(
      id: identifier,
      name: name,
    );
  }
}
