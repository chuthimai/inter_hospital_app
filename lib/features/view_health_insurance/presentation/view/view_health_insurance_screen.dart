import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_local_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_remote_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/repositories/health_insurance_repository_impl.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/cubit/health_insurance_cubit.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/widgets/health_insurance_view.dart';

class ViewHealthInsuranceScreen extends StatelessWidget {
  final _repo = HealthInsuranceRepositoryImpl(
    localDataSource: HealthInsuranceLocalDataSourceImpl(),
    remoteDataSource: HealthInsuranceRemoteDataSourceImpl(),
  );

  ViewHealthInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảo Hiểm y tế'),
      ),
      // body: BlocProvider(
      //   create: (context) => HealthInsuranceCubit(_repo),
      //   child: const HealthInsuranceView(),
      // ),
      body: const Center(
        child: Text("Không có dữ liệu"),
      ),
    );
  }
}
