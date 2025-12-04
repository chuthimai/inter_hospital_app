import 'package:flutter/material.dart';

class ViewPrescriptionScreen extends StatelessWidget {
  const ViewPrescriptionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn thuốc'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Không có dữ liệu"),
        ),
      ),
    );
  }
}