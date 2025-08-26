import 'package:dropdown_search/dropdown_search.dart';
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
            child: DropdownSearch<Hospital>(
              items: _allHospitals,
              itemAsString: (h) => h.name,
              popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: "Nhập tên bệnh viện...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  dialogProps: DialogProps(
                    insetPadding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 128.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  )),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Chọn bệnh viện",
                  border: OutlineInputBorder(),
                  hintText: "Tìm kiếm...",
                ),
              ),
              onChanged: (hospital) {
                setState(() {
                  _selectedHospital = hospital;
                });
              },
              selectedItem: _selectedHospital,
            ),
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
