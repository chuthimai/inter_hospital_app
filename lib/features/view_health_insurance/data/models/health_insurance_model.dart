import 'package:inter_hospital_app/features/view_health_insurance/domain/entities/health_insurance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'health_insurance_model.g.dart';

@JsonSerializable()
class HealthInsuranceModel {
  final int id;
  final String objectType;
  final DateTime effectiveDate;
  final DateTime expiredDate;
  final String registeredHospital;
  final DateTime? lastUpdateTime;


  HealthInsuranceModel({
    required this.id,
    required this.objectType,
    required this.effectiveDate,
    required this.expiredDate,
    required this.registeredHospital,
    this.lastUpdateTime,
  });

  factory HealthInsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$HealthInsuranceModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthInsuranceModelToJson(this);

  HealthInsurance toEntity() =>
      HealthInsurance(
        id: id,
        objectType: objectType,
        effectiveDate: effectiveDate,
        expiredDate: expiredDate,
        registeredHospital: registeredHospital,
        lastUpdateTime: lastUpdateTime ?? DateTime.now(),
      );
}