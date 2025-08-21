import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final int id;
  final String password;

  LoginRequest({required this.id, required this.password});

  factory LoginRequest.fromParams(LoginParams params) {
    return LoginRequest(id: params.id, password: params.password);
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
