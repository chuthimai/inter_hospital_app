class ResetPasswordParams {
  final int id;
  final String oldPassword;
  final String newPassword;

  ResetPasswordParams({required this.id, required this.oldPassword, required this.newPassword});
}