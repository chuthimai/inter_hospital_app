import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/widgets/medical_records.dart';

class ViewMedicalRecordScreen extends StatelessWidget {
  const ViewMedicalRecordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ViewMedicalRecordScreen'),
        ),
        body: MedicalRecords(),
      ),
    );
  }
}