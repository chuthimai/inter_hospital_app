import 'package:inter_hospital_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  final int id;

  ForgotPasswordRequest({required this.id});

  factory ForgotPasswordRequest.fromParams(ForgotPasswordParams params) {
    return ForgotPasswordRequest(id: params.id);
  }

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}