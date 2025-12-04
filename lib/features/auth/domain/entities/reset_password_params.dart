class ResetPasswordParams {
  final int _id;
  final String _oldPassword;
  final String _newPassword;

  ResetPasswordParams({
    required int id,
    required String oldPassword,
    required String newPassword,
  })  : _id = id,
        _oldPassword = oldPassword,
        _newPassword = newPassword;

  int get id => _id;
  String get oldPassword => _oldPassword;
  String get newPassword => _newPassword;
}
