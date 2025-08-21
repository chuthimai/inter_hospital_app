import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/custom_button.dart';

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
      child: Center(
        child: Column(
          children: [
            CustomButton(
              text: "Đăng xuất",
              onPressed: () => context.read<AuthCubit>().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
