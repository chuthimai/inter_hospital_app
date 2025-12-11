import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_api_model.g.dart';

@JsonSerializable()
class HospitalApiModel {
  final int identifier;
  final String name;

  HospitalApiModel({
    required this.identifier,
    required this.name,
  });

  factory HospitalApiModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalApiModelToJson(this);

  Hospital toEntity() => Hospital(id: identifier, name: name);
}
