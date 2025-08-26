import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthSuccess) return const Center();
    final user = authState.user;

    return SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: () => {
                PushScreenFactory()
                    .create(PushScreenType.profile)
                    .push(context)
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photo),
                radius: 24.sp,
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Text(
                    user.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white
                    ),
                  ),
                )
            ),
            IconButton(
                onPressed: () => {
                  PushScreenFactory()
                      .create(PushScreenType.notification)
                      .push(context)
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
            )
          ],
        )
    );
  }

}