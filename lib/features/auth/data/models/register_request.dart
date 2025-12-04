import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/register_params.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final int id;

  RegisterRequest({required this.id});

  factory RegisterRequest.fromParams(RegisterParams params) {
    return RegisterRequest(id: params.id);
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}