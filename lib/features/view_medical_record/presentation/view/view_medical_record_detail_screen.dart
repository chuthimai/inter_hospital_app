import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/datasource/medical_record_local_data_source.dart';
import '../../data/datasource/medical_record_remote_data_source.dart';
import '../../data/repositories/medical_record_repository_impl.dart';
import '../../domain/entities/medical_record.dart';
import '../../domain/repositories/medical_record_repository.dart';
import '../cubit/medical_record_cubit.dart';
import '../widgets/medical_record_detail_body.dart';

class ViewMedicalRecordDetailScreen extends StatelessWidget {
  final MedicalRecord medicalRecord;

  ViewMedicalRecordDetailScreen(this.medicalRecord, {super.key});

  final MedicalRecordRepository _repo = MedicalRecordRepositoryImpl(
    localDataSource: MedicalRecordLocalDataSourceImpl(),
    remoteDataSource: MedicalRecordRemoteDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MedicalRecordCubit(_repo))],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hồ sơ #${medicalRecord.id}'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8.sp,),
              Center(
                child: Text(
                  'Hồ sơ #${medicalRecord.id} tại ${medicalRecord.hospital.name}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(child: MedicalRecordDetailBody(medicalRecord)),
            ],
          ),
        ),
      ),
    );
  }
}
