import 'dart:ffi';

class User {
  final int id;
  final String jwt;
  final String name;
  final String email;
  final String role;
  final String photo;
  final String telecom;
  final bool gender;
  final DateTime birthDate;

  const User({
    required this.id,
    required this.jwt,
    required this.name,
    required this.email,
    required this.role,
    required this.photo,
    required this.telecom,
    required this.gender,
    required this.birthDate
  });
}
