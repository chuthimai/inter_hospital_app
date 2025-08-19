import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/setting/presentation/view/setting_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class SettingPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const SettingScreen()
    ));
  }
}