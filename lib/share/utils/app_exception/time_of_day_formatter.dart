import 'package:flutter/material.dart';

class TimeOfDayFormatter {
  /// Format ra chuỗi HH:mm (24h)
  static String format24h(TimeOfDay? time) {
    if (time == null) return "";
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  /// Format ra chuỗi h:mm a (12h, có AM/PM)
  static String format12h(TimeOfDay? time) {
    if (time == null) return "";
    final int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  /// Parse từ chuỗi HH:mm thành TimeOfDay
  static TimeOfDay? parse24h(String input) {
    try {
      final parts = input.split(':');
      if (parts.length != 2) return null;
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (_) {
      return null;
    }
  }
}
