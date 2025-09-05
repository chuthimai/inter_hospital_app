import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/app_notification.dart';

part 'notification_api_model.g.dart';

@JsonSerializable()
class NotificationApiModel {
  final int id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;

  NotificationApiModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });

  factory NotificationApiModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationApiModelToJson(this);

  AppNotification toEntity() => AppNotification(
    id: id,
    title: title,
    body: body,
    timestamp: timestamp,
    isRead: isRead,
  );
}
