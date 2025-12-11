import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/enum/permission_type.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/permission_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/permission_state.dart';
import 'package:inter_hospital_app/features/view_code/presentation/view/view_code_screen.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';

class ListCodesView extends StatefulWidget {
  const ListCodesView({super.key});

  @override
  State<ListCodesView> createState() => _ListCodesViewState();
}

class _ListCodesViewState extends State<ListCodesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthSuccess) {
        context.read<PermissionCubit>().getAllPermissions(authState.user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionCubit, PermissionState>(
      builder: (context, state) {
        if (state is PermissionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is! PermissionGetAllSuccess) {
          return const Center();
        }

        final permissions = state.permissions;
        if (permissions.isEmpty) {
          return const Center(child: Text("Không có mã nào còn hiệu lực"));
        }

        return ListView.builder(
            itemCount: permissions.length,
            itemBuilder: (context, index) {
              final permission = permissions[index];
              return Card(
                key: ValueKey(permission.id),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Icon(
                    Icons.qr_code,
                    size: 40.sp,
                  ),
                  title: Text(permission.hospital.name),
                  titleTextStyle: Theme.of(context).textTheme.titleMedium,
                  subtitle: Text(
                    "Quyền: ${permission.type.toVietnamese()}"
                    "\nHết hạn: ${DateFormatter.formatFull(permission.expiredTime)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            ViewCodeScreen(permission: permission),
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
