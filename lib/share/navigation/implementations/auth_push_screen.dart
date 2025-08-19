import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/auth/presentation/view/auth_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class AuthPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AuthScreen()),
          (Route<dynamic> route) => false, // xoá hết các route trước đó
    );
  }
}