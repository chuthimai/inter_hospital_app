import 'package:flutter/material.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String textConfirm;

  const ConfirmDeleteDialog({
    super.key,
    this.title = "Xác nhận xoá",
    this.message = "Bạn có chắc chắn muốn xoá mục này không?",
    required this.onConfirm,
    this.onCancel,
    this.textConfirm = "Xoá"
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel!();
          },
          child: const Text("Huỷ"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text(textConfirm),
        ),
      ],
    );
  }
}
