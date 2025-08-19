import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/create_code/presentation/view/create_code_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class CreateCodePushScreen implements PushScreen {
  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => const CreateCodeScreen(),
    ));
  }
}
