import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/view/view_medical_record_detail_screen.dart';

import '../../../../share/utils/date_formatter.dart';
import '../cubit/medical_record_cubit.dart';
import '../cubit/medical_record_state.dart';

class MedicalRecordListView extends StatefulWidget {
  const MedicalRecordListView({super.key});

  @override
  State<MedicalRecordListView> createState() => _MedicalRecordListViewState();
}

class _MedicalRecordListViewState extends State<MedicalRecordListView> {
  @override
  void initState() {
    super.initState();
    context.read<MedicalRecordCubit>().getAllPatientRecords();
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

      if (state is MedicalRecordGetAllFailure) {
        return Center(
          child: Text(state.message),
        );
      }

      final medicalRecords = (state as MedicalRecordGetAllSuccess).patientRecords;
      if (medicalRecords.isEmpty) {
        return const Center(
          child: Text("Không có bệnh án"),
        );
      }

      return ListView.builder(
        itemCount: medicalRecords.length,
        itemBuilder: (context, index) {
          final medicalRecord = medicalRecords[index];
          return Card(
            key: ValueKey(medicalRecord.id),
            margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: InkWell(
              child: ListTile(
                title: Text(
                  "Hồ sơ #${medicalRecord.id} tại ${medicalRecord.hospital.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    "Ngày đến khám: ${DateFormatter.format(medicalRecord.createdTime)}"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ViewMedicalRecordDetailScreen(medicalRecord)
              )),
            ),
          );
        },
      );
    });
  }
}
