import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/view/view_medical_records_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewMedicalRecordPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ViewMedicalRecordsScreen()
    ));
  }
}