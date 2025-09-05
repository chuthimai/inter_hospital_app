abstract class DotNotificationState {}

class DotNotificationUnreadState extends DotNotificationState {
  final bool hasUnread;
  DotNotificationUnreadState(this.hasUnread);
}

class DotNotificationError extends DotNotificationState {
  final String message;
  DotNotificationError(this.message);
}

class DotNotificationLoading extends DotNotificationState {}