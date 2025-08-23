import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_local_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_remote_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/repositories/health_insurance_repository_impl.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/cubit/health_insurance_cubit.dart';
import 'package:inter_hospital_app/features/view_medical_record/presentation/widgets/medical_records.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/navigation_bar_home.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/widgets/health_insurance_view.dart';
import 'package:inter_hospital_app/features/setting/presentation/widgets/settings.dart';

import '../widgets/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final HealthInsuranceRepositoryImpl _repo;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    final local = HealthInsuranceLocalDataSourceImpl();
    final remote = HealthInsuranceRemoteDataSourceImpl();
    _repo = HealthInsuranceRepositoryImpl(
      localDataSource: local,
      remoteDataSource: remote,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages = [
      const Home(),
      BlocProvider(
        create: (context) => HealthInsuranceCubit(_repo),
        child: const HealthInsuranceView(),
      ),
      const MedicalRecords(),
      const Settings()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBarHome(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
