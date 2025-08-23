import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/view/view_health_insurance_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewHealthInsurancePushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ViewHealthInsuranceScreen()
    ));
  }
}