import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.photo,
    required super.telecom,
    required super.gender,
    required super.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['identifier'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      photo: json['photo'],
      telecom: json['telecom'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birthDate']),
    );
  }

  Map<String, dynamic> toJson() => {
    'identifier': id,
    'name': name,
    'email': email,
    'role': role,
    'photo': photo,
    'telecom': telecom,
    'gender': gender,
    'birthDate': birthDate
  };
}