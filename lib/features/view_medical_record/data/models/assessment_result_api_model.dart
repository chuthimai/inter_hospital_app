import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/assessment_result.dart';
import 'assessment_item_api_model.dart';

part 'assessment_result_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AssessmentResultApiModel {
  final int identifier;
  final String value;
  final int assessmentItemIdentifier;

  AssessmentResultApiModel({
    required this.identifier,
    required this.value,
    required this.assessmentItemIdentifier,
  });

  factory AssessmentResultApiModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentResultApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentResultApiModelToJson(this);
}
