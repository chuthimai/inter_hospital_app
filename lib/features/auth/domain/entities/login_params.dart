class LoginParams {
  final int _id;
  final String _password;
  final String? _deviceToken;

  LoginParams({
    required int id,
    required String password,
    String? deviceToken,
  })  : _id = id,
        _password = password,
        _deviceToken = deviceToken;

  int get id => _id;
  String get password => _password;
  String? get deviceToken => _deviceToken;
}
