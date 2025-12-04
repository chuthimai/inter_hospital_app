import 'package:flutter/material.dart';

class ViewFollowupAppointmentScreen extends StatelessWidget {
  const ViewFollowupAppointmentScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giấy hẹn tái khám'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Không có dữ liệu"),
        ),
      ),
    );
  }
}