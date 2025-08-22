import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<bool> isCurrentDarkTheme();
  Future<void> switchTheme(bool isDarkMode);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  static const String _themeKey = 'isDarkMode';

  @override
  Future<bool> isCurrentDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey);
    if (isDarkMode == null) return false;
    return isDarkMode;
  }

  @override
  Future<void> switchTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode);
  }
}