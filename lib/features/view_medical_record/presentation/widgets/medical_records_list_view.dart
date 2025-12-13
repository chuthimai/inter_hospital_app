import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/view/view_medical_record_detail_screen.dart';

import '../../../../share/utils/date_formatter.dart';
import '../../domain/entities/medical_record.dart';

class MedicalRecordListView extends StatelessWidget {
  final List<MedicalRecord> medicalRecords;

  const MedicalRecordListView({
    required this.medicalRecords,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                builder: (ctx) =>
                    ViewMedicalRecordDetailScreen(medicalRecord))),
          ),
        );
      },
    );
  }
}
