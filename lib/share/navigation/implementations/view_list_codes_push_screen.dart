import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_code/presentation/view/view_list_codes_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewListCodesPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ViewListCodesScreen()),
          (route) => route.isFirst, // giữ lại duy nhất trang Home
    );
  }
}