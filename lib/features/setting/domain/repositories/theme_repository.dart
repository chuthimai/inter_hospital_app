abstract class ThemeRepository {
  Future<bool> isCurrentDarkTheme();
  Future<void> switchTheme(bool isDarkMode);
}