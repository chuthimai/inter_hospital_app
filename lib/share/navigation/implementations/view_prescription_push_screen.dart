import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_prescription/presentation/view/view_prescription_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewPrescriptionPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ViewPrescriptionScreen()
    ));
  }
}