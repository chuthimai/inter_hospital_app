import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/permission_repository_impl.dart';
import 'package:inter_hospital_app/features/create_code/domain/repositories/permission_repository.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/app_snack_bar.dart';

import '../../../create_code/presentation/cubit/permission_cubit.dart';
import '../../../create_code/presentation/cubit/permission_state.dart';
import '../widgets/list_codes_view.dart';

class ViewListCodesScreen extends StatelessWidget {
  ViewListCodesScreen({super.key});

  final PermissionRepository _permissionRepository = PermissionRepositoryImpl(
    localDataSource: PermissionLocalDataSourceImpl(),
    remoteDataSource: PermissionRemoteDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PermissionCubit(_permissionRepository)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách mã'),
          actions: [
            IconButton(
              onPressed: () => PushScreenFactory()
                  .create(PushScreenType.createCode)
                  .push(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: const SafeArea(
          child: ListCodesView(),
        ),
      ),
    );
  }
}
