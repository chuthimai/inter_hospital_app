class AppNotification {
  final int? id;
  final String title;
  final String body;
  DateTime timestamp;
  bool isRead;

  AppNotification({
    this.id,
    required this.title,
    required this.body,
    this.isRead=false,
    required this.timestamp,
  });
}
