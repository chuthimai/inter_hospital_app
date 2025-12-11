import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_state.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/permission_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/permission_state.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/app_snack_bar.dart';
import 'package:inter_hospital_app/share/widgets/custom_dropdown_search.dart';

class CreateCodeForm extends StatefulWidget {
  const CreateCodeForm({super.key});

  @override
  State<CreateCodeForm> createState() => _CreateCodeFormState();
}

class _CreateCodeFormState extends State<CreateCodeForm> {
  late List<Hospital> _allHospitals;
  Hospital? _selectedHospital;

  @override
  void initState() {
    super.initState();
    context.read<PermissionCubit>().setInit();
    context.read<HospitalCubit>().getAllHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PermissionCubit, PermissionState>(
      builder: (context, permissionState) {
        if (permissionState is !PermissionInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return BlocBuilder<HospitalCubit, HospitalState>(
            builder: (context, hospitalState) {
          if (hospitalState is HospitalInitial) return const Center();
          if (hospitalState is HospitalLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          _allHospitals = (hospitalState as HospitalSuccess).hospitals;

          return Row(
            children: [
              Expanded(
                  child: CustomDropdownSearch<Hospital>(
                items: _allHospitals,
                selectedItem: _selectedHospital,
                itemAsString: (h) => h.name,
                labelText: "Chọn bệnh viện",
                hintText: "Tìm kiếm...",
                searchHint: "Nhập tên bệnh viện...",
                onChanged: (hospital) {
                  setState(() {
                    _selectedHospital = hospital;
                  });
                },
                enabled: _allHospitals.isNotEmpty,
              )),
              SizedBox(width: 8.w),
              SizedBox(
                height: 68.sp,
                child: ElevatedButton(
                  onPressed: () => _onClickCreateCode(context),
                  child: const Text('Tạo mã'),
                ),
              ),
            ],
          );
        });
      },
      listener: (BuildContext context, PermissionState permissionState) {
        if (permissionState is PermissionCreatedFailure) {
          AppSnackBar.error(context, permissionState.message);
        }

        if (permissionState is PermissionCreatedSuccess) {
          AppSnackBar.success(context, "Tạo mã cấp quyền thành công");
          PushScreenFactory()
              .create(PushScreenType.viewListCodes)
              .push(context);
        }
      },
    );
  }

  void _onClickCreateCode(BuildContext context) {
    if (_selectedHospital != null) {
      context.read<PermissionCubit>().createPermission(_selectedHospital!);
    } else {
      AppSnackBar.error(context, 'Vui lòng chọn bệnh viện');
    }
  }
}
