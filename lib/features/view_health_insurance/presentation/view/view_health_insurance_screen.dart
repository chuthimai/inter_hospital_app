import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/view_health_insurance/presentation/widgets/health_insurance.dart';

class ViewHealthInsuranceScreen extends StatelessWidget {
  const ViewHealthInsuranceScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ViewHealthInsuranceScreen'),
        ),
        body: HealthInsurance(),
      ),
    );
  }
}