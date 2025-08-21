import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/auth/presentation/view/change_password_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ChangePasswordPushScreen implements PushScreen {
  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ChangePasswordScreen()
    ));
  }
}
