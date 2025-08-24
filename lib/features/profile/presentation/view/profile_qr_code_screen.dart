import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/profile/presentation/widget/profile_qr_code.dart';

class ProfileQrCodeScreen extends StatelessWidget {
  const ProfileQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: const SafeArea(
        child: ProfileQrCode(),
      ),
    );
  }

}