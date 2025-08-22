import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/setting/presentation/view/change_phone_number_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ChangePhoneNumberPushScreen implements PushScreen {
  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ChangePhoneNumberScreen()
    ));
  }
}
