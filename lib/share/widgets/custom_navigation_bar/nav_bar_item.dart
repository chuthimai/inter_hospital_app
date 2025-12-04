import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem extends StatelessWidget {
  final BottomNavigationBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(4.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isSelected ? item.activeIcon : item.icon,
              SizedBox(height: 4.sp),
              isSelected ? Expanded(
                child: Text(
                  item.label ?? '',
                  style: TextStyle(
                    fontSize: isSelected ? 13.sp : 12.sp,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    color: isSelected
                        ? Theme.of(context).colorScheme.inverseSurface
                        : Colors.grey,
                  ),
                ),
              ): const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
