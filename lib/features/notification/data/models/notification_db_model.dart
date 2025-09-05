import 'package:isar/isar.dart';

import '../../domain/entities/app_notification.dart';

part 'notification_db_model.g.dart';

@collection
class NotificationDbModel {
  Id id = Isar.autoIncrement;

  late String title;
  late String body;
  @Index()
  late DateTime timestamp;
  late bool isRead;

  NotificationDbModel({
    this.id = Isar.autoIncrement,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });

  factory NotificationDbModel.fromEntity(AppNotification notification) =>
      NotificationDbModel(
        id: notification.id ?? Isar.autoIncrement,
        title: notification.title,
        body: notification.body,
        timestamp: notification.timestamp,
        isRead: notification.isRead,
      );

  AppNotification toEntity() => AppNotification(
    id: id,
    title: title,
    body: body,
    timestamp: timestamp,
    isRead: isRead,
  );
}
