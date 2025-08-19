import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/home/presentation/view/home_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class HomePushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const HomeScreen()
    ));
  }
}