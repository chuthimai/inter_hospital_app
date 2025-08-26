import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_cubit.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_state.dart';
import 'package:inter_hospital_app/features/view_code/presentation/view/view_code_screen.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';

class ListCodesView extends StatelessWidget {
  const ListCodesView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<QrCodeCubit>().getAllValidQrCodes();
    return BlocBuilder<QrCodeCubit, QrCodeState>(
      builder: (context, state) {
        if (state is QrCodeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is! QrCodeLoadingListSuccess) {
          // Dùng khi từ trang create code nhảy sang
          // state = QrCodeSuccess || QrCodeFailure
          context.read<QrCodeCubit>().getAllValidQrCodes();
          return const Center();
        }

        final codes = state.smartContracts;
        if (codes.isEmpty) return const Center(child: Text("Không có mã nào"));

        return ListView.builder(
            itemCount: codes.length,
            itemBuilder: (context, index) {
              final code = codes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Icon(
                    Icons.qr_code,
                    size: 40.sp,
                  ),
                  title: Text(code.subject.name),
                  titleTextStyle: Theme.of(context).textTheme.titleMedium,
                  subtitle: Text(
                    "Quyền: ${code.permission}"
                        "\nHết hạn: ${DateFormatter.formatFull(code.validTo)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ViewCodeScreen(code: code),
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
