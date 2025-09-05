import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_button.dart';
import '../../domain/entities/app_notification.dart';
import '../cubit/notification_cubit.dart';

class NotificationCard extends StatefulWidget {
  final AppNotification notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final notification = widget.notification;

    return Card(
      key: Key(notification.id.toString()),
      margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
      color: notification.isRead
          ? null
          : Theme.of(context).colorScheme.surfaceVariant,
      child: Stack(
        children: [
          // Nội dung chính
          ListTile(
            title: Text(
              notification.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.body,
                  maxLines: _expanded ? null : 1,
                  overflow:
                  _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                const SizedBox(height: 4),

                // Nút Xem thêm / Thu gọn
                CustomTextButton(
                    text: _expanded ? "Thu gọn" : "Xem thêm",
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });

                      if (!_expanded) return; // chỉ mark read khi mở rộng
                      context.read<NotificationCubit>().markRead(notification);
                    }
                )
              ],
            ),
          ),

          // Badge trạng thái (góc trên bên phải)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: notification.isRead
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                notification.isRead ? "Đã đọc" : "Mới",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: notification.isRead
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
