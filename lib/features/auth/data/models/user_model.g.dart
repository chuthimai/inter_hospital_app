// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      jwt: json['jwt'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      photo: json['photo'] as String,
      telecom: json['telecom'] as String,
      gender: json['gender'] as bool,
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'jwt': instance.jwt,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'photo': instance.photo,
      'telecom': instance.telecom,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
    };
