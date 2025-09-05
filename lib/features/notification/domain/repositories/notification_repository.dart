import '../entities/app_notification.dart';

abstract class NotificationRepository {
  Stream<List<AppNotification>> getAllNotifications();
  Future<void> saveNotification(AppNotification notification);
  Future<void> markReadNotifications();
  Future<void> markReadNotification(AppNotification notification);
  Future<void> deleteAllNotifications();
  Future<bool> hasNotReadNotification();
}