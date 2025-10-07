import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:inter_hospital_app/features/notification/domain/entities/app_notification.dart';
import 'package:inter_hospital_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/notification_setting_repository.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import 'local_notification_service.dart';

class PushNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static late NotificationRepository _notificationRepository;
  static late NotificationSettingRepository _notificationSettingRepository;
  static bool _initialized = false;

  /// Hàm khởi tạo service
  static Future<void> init({
    required NotificationRepository notificationRepository,
    required NotificationSettingRepository notificationSettingRepository,
  }) async {
    if (_initialized) return;
    _initialized = true;
    _notificationRepository = notificationRepository;
    _notificationSettingRepository = notificationSettingRepository;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final enabled = await _notificationSettingRepository.getNotificationEnabled();
    if (!enabled) {
      AppLogger().info("Notifications are disabled -> skip init listeners");
      return;
    }

    AppLogger().info("PushNotificationService initialized");

    await _setupListeners();
    await _handleInitialMessage();
  }

  /// Đăng ký listener cho notification
  static Future<void> _setupListeners() async {
    // Lấy token
    final token = await _messaging.getToken();
    AppLogger().info("FCM Token: $token");

    // Foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      if (notification != null) {
        await LocalNotificationService.showNotification(
          title: notification.title ?? "Thông báo",
          body: notification.body ?? "",
        );
        AppLogger().info("Notification received");
        await _saveMessageToLocal(message);
      }
    });

    // Khi user click vào notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      AppLogger().warn("User tapped notification");
      await _navigateToNotification();
    });
  }

  /// Xử lý nếu app mở từ trạng thái terminated
  static Future<void> _handleInitialMessage() async {
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      AppLogger().warn("[initialMessage] app opened from terminated state");
      await _navigateToNotification();
    }
  }

  /// Background handler
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await _saveMessageToLocal(message);
  }

  /// Điều hướng tới màn hình thông báo
  static Future<void> _navigateToNotification() async {
    // router.push("/notifications");
  }

  /// Lưu message xuống local
  static Future<void> _saveMessageToLocal(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      final newNotification = AppNotification(
        title: notification.title ?? "Thông báo",
        body: notification.body ?? "",
        timestamp: DateTime.now(),
        isRead: false,
      );
      await _notificationRepository.saveNotification(newNotification);
    }
  }

  /// Tắt nhận thông báo
  static Future<void> disableNotifications() async {
    await _messaging.setAutoInitEnabled(false);
    AppLogger().info("Notifications disabled");
  }

  /// Bật lại nhận thông báo
  static Future<void> enableNotifications() async {
    await _messaging.setAutoInitEnabled(true);
    final token = await _messaging.getToken();
    AppLogger().info("Notifications enabled. FCM Token: $token");
  }

  /// Lấy token
  static Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
