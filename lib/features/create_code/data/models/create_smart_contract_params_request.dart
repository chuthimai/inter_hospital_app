import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/create_smart_contract_params.dart';

part 'create_smart_contract_params_request.g.dart';

@JsonSerializable()
class CreateSmartContractParamsRequest {
  final String permission;
  final DateTime validFrom;
  final DateTime validTo;
  final int subjectId;
  final int grantedBy;

  CreateSmartContractParamsRequest({
    required this.permission,
    required this.validFrom,
    required this.validTo,
    required this.subjectId,
    required this.grantedBy,
  });

  factory CreateSmartContractParamsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSmartContractParamsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateSmartContractParamsRequestToJson(this);

  factory CreateSmartContractParamsRequest.fromParams(
      CreateSmartContractParams params) {
    return CreateSmartContractParamsRequest(
      permission: params.permission,
      validFrom: params.validFrom,
      validTo: params.validTo,
      subjectId: params.subjectId,
      grantedBy: params.grantedBy,
    );
  }
}
