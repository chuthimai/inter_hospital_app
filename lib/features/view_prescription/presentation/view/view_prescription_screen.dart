import 'package:flutter/material.dart';

class ViewPrescriptionScreen extends StatelessWidget {
  const ViewPrescriptionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ViewPrescriptionScreen'),
        ),
      ),
    );
  }
}