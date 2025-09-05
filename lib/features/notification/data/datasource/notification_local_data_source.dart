import 'package:inter_hospital_app/features/notification/data/models/notification_db_model.dart';
import 'package:inter_hospital_app/share/db/isar_service.dart';
import 'package:isar/isar.dart';

abstract class NotificationLocalDataSource {
  Stream<List<NotificationDbModel>> getAllNotifications();
  Future<void> saveNotification(NotificationDbModel notification);
  Future<void> markReadNotifications();
  Future<void> markReadNotification(NotificationDbModel notification);
  Future<void> deleteAllNotifications();
  Future<bool> hasNotReadNotification();
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  @override
  Future<void> saveNotification(NotificationDbModel notification) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.notificationDbModels.put(notification);
    });
  }

  @override
  Future<void> deleteAllNotifications() async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.notificationDbModels.clear();
    });
  }

  @override
  Stream<List<NotificationDbModel>> getAllNotifications() async* {
    final isar = await IsarService.instance;
    yield* isar.notificationDbModels
        .where()
        .sortByTimestampDesc()
        .watch(fireImmediately: true);
  }

  @override
  Future<bool> hasNotReadNotification() async {
    final isar = await IsarService.instance;
    final firstUnread = await isar.notificationDbModels
        .filter()
        .isReadEqualTo(false)
        .findFirst();
    return firstUnread != null;
  }

  @override
  Future<void> markReadNotifications() async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      final unread = await isar.notificationDbModels
          .filter()
          .isReadEqualTo(false)
          .findAll();
      for (var n in unread) {
        n.isRead = true;
      }
      await isar.notificationDbModels.putAll(unread);
    });
  }

  @override
  Future<void> markReadNotification(NotificationDbModel notification) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      notification.isRead = true;
      await isar.notificationDbModels.put(notification);
    });
  }
}