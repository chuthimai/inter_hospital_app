import 'package:intl/intl.dart';

import '../../domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String identifier;
  final String name;
  final String? email;
  final String? role;
  final String? photo;
  final String? telecom;
  final bool gender;
  final String birthDate;
  final String? address;

  const UserModel({
    required this.identifier,
    required this.name,
    this.email,
    this.role,
    this.photo,
    this.telecom,
    required this.gender,
    required this.birthDate,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    DateFormat format = DateFormat("yyyy-MM-dd");
    return User(
      id: int.parse(identifier),
      name: name,
      email: email,
      role: role,
      photo: photo,
      telecom: telecom,
      gender: gender,
      birthDate: format.parse(birthDate),
      address: address,
    );
  }
}
