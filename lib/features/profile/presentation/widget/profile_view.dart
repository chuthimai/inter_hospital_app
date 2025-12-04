import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/constants/app_default.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';
import 'package:inter_hospital_app/share/widgets/info_row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthSuccess) return const Center();
    final user = authState.user;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 16.sp,
        horizontal: 32.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ảnh đại diện
          CircleAvatar(
            radius: 60.sp,
            backgroundColor: Theme.of(context).cardColor,
            child: ClipOval(
              child: user.photo == null
                  ? Image.asset(
                      AppDefault.imageLink,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : Image.network(
                      user.photo!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        // Khi load ảnh lỗi → dùng ảnh mặc định
                        return Image.asset(
                          AppDefault.imageLink,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),

          // Tên hiển thị nổi bật
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Thông tin chung
          InfoRow(
              label: "Số điện thoại",
              value: user.telecom ?? "Không có thông tin"),
          InfoRow(label: "Giới tính", value: user.gender ? "Nam" : "Nữ"),
          InfoRow(
            label: "Ngày sinh",
            value: DateFormatter.format(user.birthDate),
          ),
          InfoRow(
              label: "Địa chỉ", value: user.address ?? "Không có thông tin"),
        ],
      ),
    );
  }
}
