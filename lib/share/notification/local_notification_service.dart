import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // Android config
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS config
    const ios = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    // Kết hợp Android + iOS
    const settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // xử lý khi user bấm vào notification
      },
    );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    // Android chi tiết
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@drawable/ic_notification', // nhớ có ic_notification trong android/app/src/main/res/drawable
    );

    // iOS chi tiết
    const iosDetails = DarwinNotificationDetails();

    // Combine
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.show(
      0, // id notification
      title,
      body,
      details,
    );
  }
}
