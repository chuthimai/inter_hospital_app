class User {
  final int _id;
  final String _name;
  final String? _email;
  final String? _role;
  final String? _photo;
  final String? _telecom;
  final bool _gender;
  final DateTime _birthDate;
  final String? _address;

  const User({
    required int id,
    required String name,
    required String? email,
    String? role,
    String? photo,
    String? telecom,
    required bool gender,
    required DateTime birthDate,
    String? address,
  }) : _id = id,
        _name = name,
        _email = email,
        _role = role,
        _photo = photo,
        _telecom = telecom,
        _gender = gender,
        _birthDate = birthDate,
        _address = address;

  int get id => _id;
  String get name => _name;
  String? get email => _email;
  String? get role => _role;
  String? get photo => _photo;
  String? get telecom => _telecom;
  bool get gender => _gender;
  DateTime get birthDate => _birthDate;
  String? get address => _address;
}