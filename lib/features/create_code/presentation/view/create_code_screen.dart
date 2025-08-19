import 'package:flutter/material.dart';

class CreateCodeScreen extends StatelessWidget {
  const CreateCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CreateCodeScreen'),
        ),
      ),
    );
  }
}