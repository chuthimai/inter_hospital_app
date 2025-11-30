import 'package:json_annotation/json_annotation.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/enum/observation_status.dart';

import '../../../view_doctor/data/models/physician_api_model.dart';
import '../../../view_service/data/models/service_api_model.dart';
import 'image_study_api_model.dart';
import 'assessment_result_api_model.dart';

part 'imaging_report_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ImagingReportApiModel {
  final String focus;
  final List<ImageStudyApiModel> imageStudies;
  final String interpretation;

  ImagingReportApiModel({
    required this.focus,
    this.imageStudies = const [],
    required this.interpretation,
  });

  factory ImagingReportApiModel.fromJson(Map<String, dynamic> json) =>
      _$ImagingReportApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagingReportApiModelToJson(this);
}
