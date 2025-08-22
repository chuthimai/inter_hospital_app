class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final String photo;
  final String telecom;
  final bool gender;
  final DateTime birthDate;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.photo,
    required this.telecom,
    required this.gender,
    required this.birthDate
  });
}
