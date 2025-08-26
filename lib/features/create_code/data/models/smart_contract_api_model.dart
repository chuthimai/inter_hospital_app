import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/smart_contract.dart';
import 'hospital_api_model.dart';

part 'smart_contract_api_model.g.dart';

@JsonSerializable()
class SmartContractApiModel {
  final int id;
  final String key;
  final String permission;
  final DateTime validFrom;
  final DateTime validTo;
  final HospitalApiModel subject;

  SmartContractApiModel({
    required this.id,
    required this.key,
    required this.permission,
    required this.validFrom,
    required this.validTo,
    required this.subject,
  });

  factory SmartContractApiModel.fromJson(Map<String, dynamic> json) =>
      _$SmartContractApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmartContractApiModelToJson(this);

  SmartContract toEntity() => SmartContract(
        id: id,
        key: key,
        permission: permission,
        validFrom: validFrom,
        validTo: validTo,
        subject: subject.toEntity(),
      );
}
