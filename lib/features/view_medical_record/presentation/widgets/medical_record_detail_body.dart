import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inter_hospital_app/share/widgets/pdf_viewer.dart';

import '../../domain/entities/medical_record.dart';
import 'android_pdf_view.dart';

class MedicalRecordDetailBody extends StatelessWidget {
  final MedicalRecord patientRecord;

  const MedicalRecordDetailBody(this.patientRecord, {super.key});

  @override
  Widget build(BuildContext context) {
    if (patientRecord.pathFilePdf != null) {
      if (Platform.isAndroid) {
        return SizedBox(
          width: double.infinity,
          child: AndroidPdfView(
            filePath: patientRecord.pathFilePdf!,
          ),
        );
      }
      return Center(
        child: PdfViewer(patientRecord.pathFilePdf!),
      );
    }

    return const Center(
      child: Text("Không có dữ liệu"),
    );
  }
}
