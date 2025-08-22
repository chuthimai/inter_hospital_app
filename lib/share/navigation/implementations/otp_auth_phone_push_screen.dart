import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/setting/presentation/view/otp_auth_phone_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class OtpAuthPhonePushScreen implements PushScreen {
  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const OtpAuthPhoneScreen()
    ));
  }
}
