import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBanner {
  static void success(BuildContext context, String message) {
    _showBanner(
      context,
      message,
      iconColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    _showBanner(
      context,
      message,
      iconColor: Colors.red,
      icon: Icons.error,
    );
  }

  static void warning(BuildContext context, String message) {
    _showBanner(
      context,
      message,
      iconColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void _showBanner(
      BuildContext context,
      String message, {
        required Color iconColor,
        required IconData icon,
      }) {
    // Xóa banner cũ nếu có
    ScaffoldMessenger.of(context).clearMaterialBanners();

    final banner = MaterialBanner(
      backgroundColor: Colors.white.withOpacity(0.95),
      content: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 12.sp),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).clearMaterialBanners(),
          child: const Text("Đóng"),
        ),
      ],
    );

    ScaffoldMessenger.of(context).showMaterialBanner(banner);

    // Vì MaterialBanner không tự ẩn như SnackBar,
    // Tự clear sau vài giây
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearMaterialBanners();
      }
    });
  }
}
