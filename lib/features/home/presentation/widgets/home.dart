import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/head_home.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadHome(),
        Services(),
      ],
    );
  }
}