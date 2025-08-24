import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/profile/presentation/widget/profile_view.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProfileScreen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_2_outlined),
              onPressed: () => PushScreenFactory()
                  .create(PushScreenType.profileQrCode)
                  .push(context),
            ),
          ],
        ),
        body: const ProfileView(),
      ),
    );
  }
}
