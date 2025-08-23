import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/cubit/health_insurance_cubit.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/cubit/health_insurance_state.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';
import 'package:inter_hospital_app/share/utils/id_formatter.dart';
import 'package:inter_hospital_app/share/widgets/info_row.dart';

class HealthInsuranceView extends StatelessWidget {
  const HealthInsuranceView({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthSuccess) return const Center();
    final user = authState.user;
    context.read<HealthInsuranceCubit>().getHealthInsurance(user.id);

    return BlocBuilder<HealthInsuranceCubit, HealthInsuranceState>(
      builder: (context, state) {
        if (state is HealthInsuranceLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HealthInsuranceFailure) {
          return const Center(
            child: Text("Không có dữ liệu"),
          );
        }

        final healthInsurance =
            (state as HealthInsuranceSuccess).healthInsurance;

        return SafeArea(
          child: Column(
            children: [
              Center(
                  child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    width: 1, // độ dày viền
                  ),
                ),
                margin: EdgeInsets.all(16.sp),
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "THẺ BẢO HIỂM Y TẾ",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const Divider(height: 24),
                      InfoRow(
                          label: "Mã BHYT", value: IdFormatter.format(user.id)),
                      InfoRow(label: "Họ và tên", value: user.name),
                      InfoRow(
                        label: "Ngày sinh",
                        value: DateFormatter.format(user.birthDate),
                      ),
                      InfoRow(
                          label: "Giới tính",
                          value: user.gender ? "Nam" : "Nữ"),
                      InfoRow(
                        label: "Nơi ĐK KCB BĐ",
                        value: healthInsurance.registeredHospital,
                      ),
                      InfoRow(
                        label: "Ngày bắt đầu hiệu lực",
                        value: DateFormatter.format(healthInsurance.effectiveDate),
                      ),
                      InfoRow(
                        label: "Ngày hết hiệu lực",
                        value: DateFormatter.format(healthInsurance.expiredDate),
                      ),
                      InfoRow(
                        label: "Thời gian cập nhật cuối cùng",
                        value: DateFormatter.format(healthInsurance.lastUpdateTime),
                      ),
                    ],
                  ),
                ),
              )),
              const Expanded(child: SizedBox())
            ],
          ),
        );
      },
    );
  }
}
