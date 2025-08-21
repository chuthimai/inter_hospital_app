import 'package:inter_hospital_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  final int id;
  final String oldPassword;
  final String newPassword;

  ResetPasswordRequest({
    required this.id,
    required this.oldPassword,
    required this.newPassword,
  });

  factory ResetPasswordRequest.fromParams(ResetPasswordParams params) {
    return ResetPasswordRequest(
      id: params.id,
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
    );
  }

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
