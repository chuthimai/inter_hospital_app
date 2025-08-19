import 'package:flutter/material.dart';
import 'package:inter_hospital_app/share/utils/logger.dart';

class ServiceItem {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;

  ServiceItem({
    required this.label,
    required this.iconData,
    required this.onTap,
  });
}


final List<ServiceItem> serviceItems = [
  ServiceItem(
    label: "Bảo hiểm y tế",
    iconData: Icons.health_and_safety_outlined,
    onTap: () {
      AppLogger().info("Click Bảo hiểm y tế");
    },
  ),
  ServiceItem(
    label: "Hồ sơ sức khoẻ",
    iconData: Icons.folder_shared,
    onTap: () {
      AppLogger().info("Click Hồ sơ sức khoẻ");
    },
  ),
  ServiceItem(
    label: "Đơn thuốc",
    iconData: Icons.medical_services,
    onTap: () {
      AppLogger().info("Click Xem đơn thuốc");
    },
  ),
  ServiceItem(
    label: "Giấy chuyển viện",
    iconData: Icons.article,
    onTap: () {
      AppLogger().info("Click Giấy chuyển viện");
    },
  ),
];