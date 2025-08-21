import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/auth/presentation/view/login_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class LoginPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginScreen()),
          (Route<dynamic> route) => false, // xoá hết các route trước đó
    );
  }
}