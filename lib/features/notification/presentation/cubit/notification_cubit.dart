import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit(this.repository) : super(NotificationLoading());

  void loadNotifications() {
    emit(NotificationLoading());
    repository.getAllNotifications().listen(
          (notifications) {
        emit(NotificationLoaded(notifications));
      },
      onError: (e) {
        emit(NotificationError(e.toString()));
      },
    );
  }

  Future<void> markRead(AppNotification notification) async {
    await repository.markReadNotification(notification);
  }

  Future<void> markReadAll() async {
    await repository.markReadNotifications();
  }
}
