import 'package:json_annotation/json_annotation.dart';
import 'package:inter_hospital_app/features/create_code/data/models/hospital_api_model.dart';

part 'permission_api_model.g.dart';

@JsonSerializable()
class PermissionApiModel {
  final int identifier;
  final String type;
  final DateTime expiredTime;
  final int hospitalIdentifier;
  final String userIdentifier;

  PermissionApiModel({
    required this.identifier,
    required this.type,
    required this.expiredTime,
    required this.hospitalIdentifier,
    required this.userIdentifier,
  });

  factory PermissionApiModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionApiModelToJson(this);

}
