import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/app_snack_bar.dart';
import 'package:inter_hospital_app/share/widgets/custom_button_outline.dart';

import '../cubit/theme_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is! AuthSuccess) {
          PushScreenFactory().create(PushScreenType.login).push(context);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "change_password",
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(Icons.lock_outline),
                      title: const Text("Đổi mật khẩu"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => PushScreenFactory()
                          .create(PushScreenType.changePassword)
                          .push(context),
                    ),
                  ),
                ),
                const Divider(),
                Hero(
                  tag: "change_phone_number",
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(Icons.phone_android),
                      title: const Text("Đổi số điện thoại"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => PushScreenFactory()
                          .create(PushScreenType.changePhoneNumber)
                          .push(context),
                    ),
                  ),
                ),
                const Divider(),
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_outlined),
                  title: const Text("Thông báo"),
                  value: true,
                  onChanged: (value) {
                    // TODO: lưu setting vào local (SharedPreferences)
                  },
                ),
                const Divider(),
                BlocBuilder<ThemeCubit, ThemeMode?>(builder: (context, theme) {
                  final bool isDark = theme == ThemeMode.dark;
                  return SwitchListTile(
                    secondary: isDark
                        ? const Icon(Icons.dark_mode_outlined)
                        : const Icon(Icons.light_mode_outlined),
                    title: isDark
                        ? const Text("Chế độ tối")
                        : const Text("Chế độ sáng"),
                    value: isDark,
                    onChanged: (value) =>
                        context.read<ThemeCubit>().switchTheme(),
                  );
                }),
                SizedBox(height: 32.sp),
                CustomButtonOutline(
                  text: "Đăng xuất",
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                    AppSnackBar.success(context, "Đăng xuất thành công");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
