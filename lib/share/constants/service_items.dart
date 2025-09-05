import 'package:flutter/material.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';


class ServiceItem {
  final String label;
  final IconData iconData;
  final Function(BuildContext context) onTap;

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
    onTap: (BuildContext context) {
      PushScreenFactory()
          .create(PushScreenType.viewHealthInsurance)
          .push(context);
    },
  ),
  ServiceItem(
    label: "Hồ sơ sức khoẻ",
    iconData: Icons.folder_shared_outlined,
    onTap: (BuildContext context) {
      PushScreenFactory()
          .create(PushScreenType.viewMedicalRecord)
          .push(context);
    },
  ),
  ServiceItem(
    label: "Đơn thuốc",
    iconData: Icons.medical_services_outlined,
    onTap: (BuildContext context) {
      PushScreenFactory()
          .create(PushScreenType.viewPrescription)
          .push(context);
    },
  ),
  ServiceItem(
    label: "Giấy chuyển viện",
    iconData: Icons.article_outlined,
    onTap: (BuildContext context) {
      PushScreenFactory()
          .create(PushScreenType.viewTransferLetter)
          .push(context);
    },
  ),
];
