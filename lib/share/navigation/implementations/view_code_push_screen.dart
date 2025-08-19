import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_code/presentation/view/view_code_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewCodePushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ViewCodeScreen()
    ));
  }
}