import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/auth/presentation/view/forgot_password_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ForgotPasswordPushScreen implements PushScreen {
  @override
  void push(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const ForgotPasswordScreen()
    ));
  }
}
