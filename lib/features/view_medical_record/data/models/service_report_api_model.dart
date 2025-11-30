import 'package:hospital_app/features/view_medical_record/domain/entities/diagnosis_report.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/enum/condition_diagnosis_severity.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/enum/observation_category_code.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/enum/observation_method.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/image_report.dart';
import 'package:hospital_app/features/view_medical_record/domain/entities/measurement_indicator.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../view_doctor/data/models/physician_api_model.dart';
import '../../../view_service/data/models/service_api_model.dart';
import '../../domain/entities/assessment_result.dart';
import '../../domain/entities/service_report.dart';
import '../../domain/entities/enum/observation_status.dart';
import 'assessment_item_api_model.dart';
import 'assessment_result_api_model.dart';
import 'diagnosis_report_api_model.dart';
import 'imaging_report_api_model.dart';

part 'service_report_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ServiceReportApiModel {
  final int identifier;
  final String category;
  final String method;
  final bool status;
  final DateTime? effectiveTime;
  final ServiceApiModel service;
  final PhysicianApiModel? performer;
  final List<AssessmentResultApiModel> assessmentResults;
  final DiagnosisReportApiModel? diagnosisReport;
  final ImagingReportApiModel? imagingReport;

  ServiceReportApiModel({
    required this.identifier,
    required this.category,
    required this.method,
    required this.status,
    this.effectiveTime,
    required this.service,
    this.performer,
    this.assessmentResults = const [],
    this.diagnosisReport,
    this.imagingReport,
  });

  factory ServiceReportApiModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceReportApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReportApiModelToJson(this);

  /// Convert API model → Domain entity
  ServiceReport toEntity() {
    if (diagnosisReport != null) {
      return DiagnosisReport(
        id: identifier,
        category: ObservationCategoryCodeExtension.fromCode(category),
        method: ObservationMethodExtension.fromCode(method),
        status:
        status ? ObservationStatus.final_ : ObservationStatus.registered,
        service: service.toEntity(),
        performer: performer?.toEntity(),
        assessmentResults: _toAssessmentResultEntities(),
        type: diagnosisReport!.type,
        conclusion: diagnosisReport!.conclusion,
        severity: ConditionDiagnosisSeverityExtension.fromCode(
            diagnosisReport!.severity),
        recordedTime: diagnosisReport!.recordedTime,
      );
    }

    if (imagingReport != null) {
      return ImageReport(
        id: identifier,
        category: ObservationCategoryCodeExtension.fromCode(category),
        method: ObservationMethodExtension.fromCode(method),
        status:
        status ? ObservationStatus.final_ : ObservationStatus.registered,
        service: service.toEntity(),
        performer: performer?.toEntity(),
        assessmentResults: _toAssessmentResultEntities(),
        focus: imagingReport!.focus,
        interpretation: imagingReport!.interpretation,
        imageStudies:
        imagingReport!.imageStudies.map((e) => e.toEntity()).toList(),
      );
    }
    return ServiceReport(
      id: identifier,
      category: ObservationCategoryCodeExtension.fromCode(category),
      method: ObservationMethodExtension.fromCode(method),
      status: status ? ObservationStatus.final_ : ObservationStatus.registered,
      service: service.toEntity(),
      performer: performer?.toEntity(),
      assessmentResults: _toAssessmentResultEntities(),
    );
  }

  List<AssessmentResult> _toAssessmentResultEntities() {
    final List<AssessmentResult> assessmentResultEntities =
    service.assessmentItems.map((e) {
      if (e.measurementItem != null) {
        return MeasurementIndicator(
          id: e.identifier,
          name: e.name,
          type: e.measurementItem!.type,
          unit: e.measurementItem!.unit,
          minimum: e.measurementItem!.minimum,
          maximum: e.measurementItem!.maximum,
        );
      }

      return AssessmentResult(id: e.identifier, name: e.name);
    }).toList();

    final Map<int, AssessmentResult> mapIdToAssessmentResult = {
      for (final assessmentResult in assessmentResultEntities)
        assessmentResult.id: assessmentResult
    };
    // Ghép giá trị vào node assessmentResults
    for (final item in assessmentResults) {
      final assessmentResult = mapIdToAssessmentResult[item.assessmentItemIdentifier];
      if (assessmentResult != null) assessmentResult.value = item.value;
    }

    return _buildAssessmentResultTrees(mapIdToAssessmentResult, service.assessmentItems);
  }

  List<AssessmentResult> _buildAssessmentResultTrees(
      Map<int, AssessmentResult> mapIdToAssessmentResult,
      List<AssessmentItemApiModel> assessmentItems,
      ) {
    final List<AssessmentResult> roots = [];

    for (final item in assessmentItems) {
      final node = mapIdToAssessmentResult[item.identifier];
      if (node == null) continue;

      if (item.parentIdentifier == null) {
        roots.add(node);
      } else {
        final parent = mapIdToAssessmentResult[item.parentIdentifier];
        parent?.addChildAssessmentResult(node);
      }
    }

    return roots;
  }

}
