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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.sp),
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
                padding: const EdgeInsets.all(12.0),
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
    );
  }
}
