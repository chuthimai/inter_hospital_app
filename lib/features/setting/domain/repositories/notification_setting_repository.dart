abstract class NotificationSettingRepository {
  Future<void> setNotificationEnabled(bool enabled);
  Future<bool> getNotificationEnabled();
}