import 'package:flutter/material.dart';
import '../../domain/entities/medical_record.dart';
import '../widgets/medical_record_detail_body.dart';

class ViewMedicalRecordDetailScreen extends StatelessWidget {
  final MedicalRecord medicalRecord;

  const ViewMedicalRecordDetailScreen(this.medicalRecord, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ sơ #${medicalRecord.id} tại ${medicalRecord.hospital.name}'),
      ),
      body: SafeArea(
        child: MedicalRecordDetailBody(medicalRecord),
      ),
    );
  }
}
