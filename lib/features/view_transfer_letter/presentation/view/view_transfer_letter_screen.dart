import 'package:flutter/material.dart';

class ViewTransferLetterScreen extends StatelessWidget {
  const ViewTransferLetterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giấy chuyển viện'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Không có dữ liệu"),
        ),
      ),
    );
  }
}