import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonOutline extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: Size(342.w, 64.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // bo góc
          side: BorderSide(
            color: isDark
                ? Colors.white38
                : Theme.of(context).primaryColor, // màu viền
            width: 2, // độ dày viền
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white38 : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
