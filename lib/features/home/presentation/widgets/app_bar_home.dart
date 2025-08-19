import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/utils/logger.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 24.sp,
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Text(
                    "Chu Thi Mai",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white
                    ),
                  ),
                )
            ),
            IconButton(
                onPressed: () => {
                  AppLogger().info("Click Thông báo")
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
            )
          ],
        )
    );
  }

}