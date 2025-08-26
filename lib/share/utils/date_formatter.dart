class DateFormatter {
  static String format(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}';
  }

  static String formatFull(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year} '
        '${d.hour.toString().padLeft(2, '0')}:'
        '${d.minute.toString().padLeft(2, '0')}:'
        '${d.second.toString().padLeft(2, '0')}';
  }

  static String formatForOrCode(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}'
        '${d.month.toString().padLeft(2, '0')}'
        '${d.year}';
  }
}
