import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:inter_hospital_app/features/notification/domain/entities/app_notification.dart';
import 'package:inter_hospital_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/notification_setting_repository.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import 'local_notification_service.dart';

class PushNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static late BuildContext _context;
  static late NotificationRepository _notificationRepository;
  static late NotificationSettingRepository _notificationSettingRepository;

  /// Hàm khởi tạo service
  static Future<void> init({
    required BuildContext context,
    required NotificationRepository notificationRepository,
    required NotificationSettingRepository notificationSettingRepository,
  }) async {
    _context = context;
    _notificationRepository = notificationRepository;
    _notificationSettingRepository = notificationSettingRepository;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final enabled = await _notificationSettingRepository.getNotificationEnabled();
    if (!enabled) {
      AppLogger().info("Notifications are disabled -> skip init listeners");
      return;
    }

    await _setupListeners();
    await _handleInitialMessage();
  }

  /// Đăng ký listener cho notification
  static Future<void> _setupListeners() async {
    // Lấy token
    final token = await _messaging.getToken();
    AppLogger().info("FCM Token: $token");

    // Foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        LocalNotificationService.showNotification(
          title: notification.title ?? "Thông báo",
          body: notification.body ?? "",
        );
        _saveMessageToLocal(message);
      }
    });

    // Khi user click vào notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _saveMessageToLocal(message);
      _navigateToNotification();
    });
  }

  /// Xử lý nếu app mở từ trạng thái terminated
  static Future<void> _handleInitialMessage() async {
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _saveMessageToLocal(initialMessage);
      _navigateToNotification();
    }
  }

  /// Tắt nhận thông báo (không tự động tạo token nữa)
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

  /// Background handler
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    AppLogger().info("Background message: ${message.messageId}");
    _saveMessageToLocal(message);
  }

  /// Điều hướng tới màn hình thông báo
  static void _navigateToNotification() {
    PushScreenFactory().create(PushScreenType.notification).push(_context);
  }

  static void _saveMessageToLocal(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      final newNotification = AppNotification(
        title: notification.title ?? "Thông báo",
        body: notification.body ?? "",
        timestamp: DateTime.now(),
        isRead: false,
      );
      _notificationRepository.saveNotification(newNotification);
    }
  }

  /// Lấy token
  static Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
