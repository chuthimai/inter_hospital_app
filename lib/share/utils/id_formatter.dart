class IdFormatter {
  static String format(int id) {
    return id.toString().padLeft(12, '0');
  }
}
