import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/profile/presentation/widget/profile_qr_code.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/navigation_bar_home.dart';
import 'package:inter_hospital_app/features/setting/presentation/widgets/settings.dart';

import '../widgets/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages = [const Home(), const ProfileQrCode(), const Settings()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBarHome(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
