import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    const navBarHeight = kBottomNavigationBarHeight;

    return Padding(
      padding: EdgeInsets.fromLTRB(32.sp, 0, 8.sp, 24.sp),
      child: SizedBox(
        height: navBarHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / items.length;

            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12.r,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Các item
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(items.length, (index) {
                      final isSelected = index == currentIndex;
                      final item = items[index];

                      return NavBarItem(
                        item: item,
                        isSelected: isSelected,
                        onTap: () => onTap(index),
                      );
                    }),
                  ),

                  /// Glass indicator
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    left: currentIndex == 0
                        ? currentIndex * itemWidth - 0.sp
                        : currentIndex == items.length - 1
                            ? currentIndex * itemWidth + 12.sp
                            : currentIndex * itemWidth - 12.sp,
                    bottom: 0,
                    child: Container(
                      width: currentIndex == 0
                          ? itemWidth + 16.sp - 24.sp
                          : currentIndex == items.length - 1
                              ? itemWidth + 16.sp - 24.sp
                              : itemWidth + 16.sp,
                      height: navBarHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.30),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
