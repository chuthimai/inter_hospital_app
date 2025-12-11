import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/hospital_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/hosptial_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/hospital_repository_impl.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/permission_repository_impl.dart';
import 'package:inter_hospital_app/features/create_code/domain/repositories/hosptital_repository.dart';
import 'package:inter_hospital_app/features/create_code/domain/repositories/permission_repository.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/permission_cubit.dart';

import '../widgets/create_code_form.dart';

class CreateCodeScreen extends StatelessWidget {
  CreateCodeScreen({super.key});

  final HospitalRepository _hospitalRepository = HospitalRepositoryImpl(
    remoteDataSource: HospitalRemoteDataSourceImpl(),
    localDataSource: HospitalLocalDataSourceImpl(),
  );

  final PermissionRepository _permissionRepository = PermissionRepositoryImpl(
    localDataSource: PermissionLocalDataSourceImpl(),
    remoteDataSource: PermissionRemoteDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HospitalCubit(_hospitalRepository)..getAllHospitals()),
        BlocProvider(
            create: (context) => PermissionCubit(_permissionRepository)),
      ],
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
