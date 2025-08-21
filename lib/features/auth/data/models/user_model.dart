import '../../domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String jwt;
  final String name;
  final String email;
  final String role;
  final String photo;
  final String telecom;
  final bool gender;
  final DateTime birthDate;

  const UserModel(
      {required this.id,
      required this.jwt,
      required this.name,
      required this.email,
      required this.role,
      required this.photo,
      required this.telecom,
      required this.gender,
      required this.birthDate});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
        id: id,
        jwt: jwt,
        name: name,
        email: email,
        role: role,
        photo: photo,
        telecom: telecom,
        gender: gender,
        birthDate: birthDate,
      );
}
