import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_transfer_letter/presentation/view/view_transfer_letter_screen.dart';
import 'package:inter_hospital_app/share/navigation/interfaces/push_screen.dart';

class ViewTransferLetterPushScreen implements PushScreen {

  @override
  void push(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const ViewTransferLetterScreen()
    ));
  }
}