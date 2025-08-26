import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/hospital_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/hosptial_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/hospital_repository_impl.dart';
import 'package:inter_hospital_app/features/create_code/domain/repositories/hosptital_repository.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_cubit.dart';


import '../widgets/create_code_form.dart';

class CreateCodeScreen extends StatelessWidget {
  CreateCodeScreen({super.key});

  final HospitalRepository _repository = HospitalRepositoryImpl(
    remoteDataSource: HospitalRemoteDataSourceImpl(),
    localDataSource: HospitalLocalDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalCubit(_repository)..getAllHospitals(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tạo mã cấp quyền'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: const CreateCodeForm(),
          ),
        ),
      ),
    );
  }
}
