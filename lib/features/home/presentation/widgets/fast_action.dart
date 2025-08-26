import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/fast_action_item_view.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';

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
            PushScreenFactory()
                .create(PushScreenType.createCode)
                .push(context)
          },
        ),
        const Expanded(child: SizedBox()),
        FastActionItemView(
          label: "Các mã đã tạo",
          icon: Icons.view_list_outlined,
          onClick: () => {
            PushScreenFactory()
                .create(PushScreenType.viewListCodes)
                .push(context)
          },
        ),
      ],
    );
  }

}