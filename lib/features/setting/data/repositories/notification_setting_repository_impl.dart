import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/repositories/notification_setting_repository.dart';
import '../datasources/notification_setting_local_data_source.dart';

class NotificationSettingRepositoryImpl implements NotificationSettingRepository {
  final NotificationSettingLocalDataSource _localDataSource;

  NotificationSettingRepositoryImpl(this._localDataSource);

  @override
  Future<bool> getNotificationEnabled() async {
    try {
      return await _localDataSource.getNotificationEnabled();
    } catch(e) {
      AppLogger().error("Local error: $e");
    }
    return false;
  }

  @override
  Future<void> setNotificationEnabled(bool enabled) async {
    try {
      await _localDataSource.setNotificationEnabled(enabled);
    } catch(e) {
      AppLogger().error("Local error: $e");
    }
  }

}