import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/constants/service_items.dart';

class ServiceItemView extends StatelessWidget {
  final ServiceItem serviceItem;

  const ServiceItemView({
    super.key,
    required this.serviceItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 4.sp),
        child: Column(
          children: [
            Material(
              color: Theme.of(context).primaryColor, // màu nền
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () => {
                  serviceItem.onTap(context)
                },
                splashColor: Theme.of(context).hoverColor.withOpacity(0.3),
                customBorder: const CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Icon(
                      serviceItem.iconData,
                      size: 32.sp,
                      color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.sp),
            Text(
              serviceItem.label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
