import 'package:flutter/material.dart';

class ViewCodeScreen extends StatelessWidget {
  const ViewCodeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ViewCodeScreen'),
        ),
      ),
    );
  }
}