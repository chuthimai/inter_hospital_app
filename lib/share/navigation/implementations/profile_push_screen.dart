import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/profile/presentation/view/profile_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ProfilePushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ProfileScreen()
    ));
  }
}