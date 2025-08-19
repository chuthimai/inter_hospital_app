import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/home/presentation/widgets/service_item_view.dart';
import 'package:inter_hospital_app/share/constants/service_items.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Các dịch vụ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(8.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2/3,
                crossAxisSpacing: 4.sp,
                mainAxisSpacing: 4.sp,
              ),
              children: [
                ...serviceItems.map((e) => ServiceItemView(serviceItem: e))
              ],
            )
          ],
        ),
      ),
    );
  }

}