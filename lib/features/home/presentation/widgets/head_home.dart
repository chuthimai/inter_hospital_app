import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/app_bar_home.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/fast_action.dart';

class HeadHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
      ),
      child: Padding (
        padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 16.sp),
        child: Column(
          children: [
            const AppBarHome(),
            SizedBox(height: 16.sp),
            const FastAction()
          ],
        ),
      ),
    );
  }

}