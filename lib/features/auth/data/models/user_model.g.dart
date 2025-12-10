// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      role: json['role'] as String?,
      photo: json['photo'] as String?,
      telecom: json['telecom'] as String?,
      gender: json['gender'] as bool,
      birthDate: json['birthDate'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'photo': instance.photo,
      'telecom': instance.telecom,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'address': instance.address,
    };
