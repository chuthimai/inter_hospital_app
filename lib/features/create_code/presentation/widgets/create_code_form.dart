import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/create_smart_contract_params.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/hospital_state.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_cubit.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalCubit, HospitalState>(builder: (context, state) {
      if (state is HospitalInitial) return const Center();
      if (state is HospitalLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      _allHospitals = (state as HospitalSuccess).hospitals;

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
            )
          ),
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
  }

  void _onClickCreateCode(BuildContext context) {
    if (_selectedHospital != null) {
      final request = CreateSmartContractParams(
        permission: 'read',
        validFrom: DateTime.now(),
        validTo: DateTime.now().add(const Duration(days: 1)),
        subjectId: _selectedHospital!.id,
        grantedBy: (context.read<AuthCubit>().state as AuthSuccess).user.id,
      );
      context.read<QrCodeCubit>().createQrCode(request);
      PushScreenFactory().create(PushScreenType.viewListCodes).push(context);
    } else {
      AppSnackBar.error(context, 'Vui lòng chọn bệnh viện');
    }
  }
}
