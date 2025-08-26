import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/utils/user_qr_payload.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';


class ProfileQrCode extends StatelessWidget {
  const ProfileQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthSuccess) return const Center();
    final user = authState.user;
    
    return Padding(
      padding: EdgeInsets.all(32.sp),
      child: Center(
        child: PrettyQrView.data(
          data: UserQrPayload.format(user),
          errorCorrectLevel: QrErrorCorrectLevel.H,
          decoration: PrettyQrDecoration(
            shape: PrettyQrSmoothSymbol(
              color: Theme.of(context).dividerColor
            ),
            quietZone: const PrettyQrQuietZone.modules(2),
          ),
        ),
      ),
    );
  }

}