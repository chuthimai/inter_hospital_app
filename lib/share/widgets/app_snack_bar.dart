import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  static void success(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      iconColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      iconColor: Colors.red,
      icon: Icons.error,
    );
  }

  static void warning(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      iconColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void _showSnackBar(
      BuildContext context,
      String message, {
        required Color iconColor,
        required IconData icon,
      }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white.withOpacity(0.9),
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, MediaQuery.of(context).size.height/5 * 4),
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
      ),
    );
  }
}
