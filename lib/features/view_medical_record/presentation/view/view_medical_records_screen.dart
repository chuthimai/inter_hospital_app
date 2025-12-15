import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/datasource/medical_record_local_data_source.dart';
import '../../data/datasource/medical_record_remote_data_source.dart';
import '../../data/repositories/medical_record_repository_impl.dart';
import '../../domain/repositories/medical_record_repository.dart';
import '../cubit/medical_record_cubit.dart';
import '../cubit/medical_record_state.dart';
import '../widgets/medical_records_view.dart';

class ViewMedicalRecordsScreen extends StatelessWidget {
  ViewMedicalRecordsScreen({super.key});

  final MedicalRecordRepository _repo = MedicalRecordRepositoryImpl(
    localDataSource: MedicalRecordLocalDataSourceImpl(),
    remoteDataSource: MedicalRecordRemoteDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MedicalRecordCubit(_repo)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hồ sơ sức khoẻ'),
        ),
        body: SafeArea(
          child: BlocBuilder<MedicalRecordCubit, MedicalRecordState>(
            builder: (context, state) {
              return RefreshIndicator(
                  onRefresh: () async {
                    context.read<MedicalRecordCubit>().getAllPatientRecords();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
                    child: const MedicalRecordsView(),
                  )
              );
            }
          )
        ),
      ),
    );
  }
}
