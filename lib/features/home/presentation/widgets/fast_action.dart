import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/fast_action_item_view.dart';
import 'package:inter_hospital_app/share/utils/logger.dart';

class FastAction extends StatelessWidget {
  const FastAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FastActionItemView(
          label: "Tạo mã chia sẻ bệnh án",
          icon: Icons.qr_code_2_outlined,
          onClick: () => {
            AppLogger().info("Click Tạo mã chia sẻ bệnh án")
          },
        ),
        const Expanded(child: SizedBox()),
        FastActionItemView(
          label: "Các mã đã tạo",
          icon: Icons.view_list_outlined,
          onClick: () => {
            AppLogger().info("Click Các mã đã tạo")
          },
        ),
      ],
    );
  }

}