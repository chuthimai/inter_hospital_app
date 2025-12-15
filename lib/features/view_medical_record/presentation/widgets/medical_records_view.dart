import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';

import '../../domain/entities/medical_record.dart';
import '../cubit/medical_record_cubit.dart';
import '../cubit/medical_record_state.dart';
import 'medical_records_list_view.dart';

class MedicalRecordsView extends StatefulWidget {
  const MedicalRecordsView({super.key});

  @override
  State<MedicalRecordsView> createState() => _MedicalRecordsViewState();
}

class _MedicalRecordsViewState extends State<MedicalRecordsView> {
  int _selectedHospitalId = 0;
  List<MedicalRecord> _medicalRecords = [];
  List<Hospital> _hospitals = [];

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

      final medicalRecords =
          (state as MedicalRecordGetAllSuccess).patientRecords;
      _medicalRecords = medicalRecords;
      if (medicalRecords.isEmpty) {
        return const Center(
          child: Text("Không có bệnh án"),
        );
      }
      final hospitals = medicalRecords
          .map((e) => e.hospital)
          .fold<Map<int, Hospital>>(
            {},
            (map, hospital) {
              map[hospital.id] = hospital;
              return map;
            },
          )
          .values
          .toList();
      _hospitals = hospitals;
      _hospitals.add(Hospital(id: 0, name: "Tất cả"));
      return Column(
        children: [
          SizedBox(height: 8.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: DropdownButtonFormField<int>(
              value: _selectedHospitalId,
              items: _hospitals.map((h) {
                return DropdownMenuItem<int>(
                  value: h.id,
                  child: Text(h.name),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: "Chọn bệnh viện",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  if (val == null) {
                    _selectedHospitalId = 0;
                  } else {
                    _selectedHospitalId = val;
                  }
                  if (0 == _selectedHospitalId) {
                    _medicalRecords = medicalRecords;
                    return;
                  }
                  _medicalRecords = medicalRecords
                      .where((e) => e.hospital.id == _selectedHospitalId)
                      .toList();
                });
              },
            ),
          ),
          SizedBox(height: 8.sp),
          Expanded(
            child: MedicalRecordListView(
              medicalRecords: _medicalRecords,
            ),
          )
        ],
      );
    });
  }
}
