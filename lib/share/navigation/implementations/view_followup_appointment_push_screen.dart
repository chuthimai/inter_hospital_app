import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_followup_appointment/presentation/view/view_followup_appointment_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewFollowupAppointmentPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ViewFollowupAppointmentScreen()
    ));
  }
}