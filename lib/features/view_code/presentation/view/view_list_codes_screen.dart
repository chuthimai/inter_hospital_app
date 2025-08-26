import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_state.dart';
import 'package:inter_hospital_app/features/view_code/presentation/widgets/list_codes_view.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/app_snack_bar.dart';

class ViewListCodesScreen extends StatelessWidget {
  const ViewListCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách mã'),
        actions: [
          IconButton(
            onPressed: () => PushScreenFactory()
                .create(PushScreenType.createCode)
                .push(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: BlocListener<QrCodeCubit, QrCodeState>(
          listener: (context, state) {
            if (state is QrCodeCreateSuccess) {
              AppSnackBar.success(context, "Tạo mã thành công");
            }
            if (state is QrCodeCreateFailure) {
              AppSnackBar.error(context, state.message);
            }
          },
          child: const ListCodesView(),
        ),
      ),
    );
  }
}
