import 'package:flutter/material.dart';

class NavigationBarHome extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const NavigationBarHome({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Trang chủ", tooltip: 'Trang chủ'),
        BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: "Bảo hiểm y tế",
            tooltip: 'Bảo hiểm y tế'),
        BottomNavigationBarItem(
            icon: Icon(Icons.folder_shared),
            label: "Hồ sơ sức khoẻ",
            tooltip: 'Hồ sơ sức khoẻ'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cài đặt",
            tooltip: 'Cài đặt'
        ),
      ],
    );
  }
}
