// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      identifier: (json['identifier'] as num).toInt(),
      password: json['password'] as String,
      role: json['role'] as String? ?? "patient",
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
      'role': instance.role,
    };
