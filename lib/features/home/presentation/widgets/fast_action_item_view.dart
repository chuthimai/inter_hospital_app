import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FastActionItemView extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onClick,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
          child: SizedBox(
            width: 150.sp,
            height: 64.sp,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      size: 36.sp,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  const FastActionItemView({
    super.key,
    required this.label,
    required this.icon,
    required this.onClick
  });
}