import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasource/notification_local_data_source.dart';
import '../models/notification_db_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource _localDataSource;

  NotificationRepositoryImpl(this._localDataSource);

  @override
  Future<void> saveNotification(AppNotification notification) async {
    try {
      await _localDataSource
          .saveNotification(NotificationDbModel.fromEntity(notification));
    } catch (e) {
      AppLogger().error("Local Error: $e");
    }
  }

  @override
  Future<void> deleteAllNotifications() async {
    try {
      await _localDataSource.deleteAllNotifications();
    } catch (e) {
      AppLogger().error("Local Error: $e");
    }
  }

  @override
  Stream<List<AppNotification>> getAllNotifications() {
    return _localDataSource
        .getAllNotifications()
        .map((list) => list.map((model) => model.toEntity()).toList());
  }

  @override
  Stream<bool> hasNotReadNotification() {
    return _localDataSource.hasNotReadNotification();
  }

  @override
  Future<void> markReadNotifications() async {
    try {
      await _localDataSource.markReadNotifications();
    } catch (e) {
      AppLogger().error("Local Error: $e");
    }
  }

  @override
  Future<void> markReadNotification(AppNotification notification) async {
    try {
      await _localDataSource.markReadNotification(
          NotificationDbModel.fromEntity(notification));
    } catch (e) {
      AppLogger().error("Local Error: $e");
    }
  }
}
