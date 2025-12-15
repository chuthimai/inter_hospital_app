import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/cubit/medical_record_state.dart';
import 'package:inter_hospital_app/share/widgets/pdf_viewer.dart';

import '../../domain/entities/medical_record.dart';
import 'android_pdf_view.dart';

class MedicalRecordDetailBody extends StatefulWidget {
  final MedicalRecord patientRecord;

  const MedicalRecordDetailBody(this.patientRecord, {super.key});

  @override
  State<MedicalRecordDetailBody> createState() => _MedicalRecordDetailBodyState();
}

class _MedicalRecordDetailBodyState extends State<MedicalRecordDetailBody> {
  @override
  void initState() {
    super.initState();
    context
        .read<MedicalRecordCubit>()
        .getDetailPatientRecord(widget.patientRecord);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalRecordCubit, MedicalRecordState>(
        builder: (context, state) {
          if (state is MedicalRecordInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MedicalRecordGetDetailFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          final patientRecord =
              (state as MedicalRecordGetDetailSuccess).patientRecord;

          if (patientRecord.pathFilePdf != null) {
            if (Platform.isAndroid) {
              return SizedBox(
                width: double.infinity,
                child: AndroidPdfView(
                  filePath: widget.patientRecord.pathFilePdf!,
                ),
              );
            }
            return Center(
              child: PdfViewer(widget.patientRecord.pathFilePdf!),
            );
          }

          return const Center(
            child: Text("Không có dữ liệu"),
          );
        });

  }
}
