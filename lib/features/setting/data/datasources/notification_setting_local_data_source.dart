import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationSettingLocalDataSource {
  Future<void> setNotificationEnabled(bool enabled);
  Future<bool> getNotificationEnabled();
}

class NotificationSettingLocalDataSourceImpl implements NotificationSettingLocalDataSource {
  final _key = "notification_enabled";

  @override
  Future<bool> getNotificationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? true;
  }

  @override
  Future<void> setNotificationEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, enabled);
  }

}