import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/repositories/notification_repository.dart';
import 'dot_notification_state.dart';

class DotNotificationCubit extends Cubit<DotNotificationState> {
  final NotificationRepository repository;

  DotNotificationCubit(this.repository) : super(DotNotificationLoading());

  Future<void> checkUnread() async {
    try {
      final hasUnread = await repository.hasNotReadNotification();
      AppLogger().info("Has unread notification: $hasUnread");
      emit(DotNotificationUnreadState(hasUnread));
    } catch (e) {
      emit(DotNotificationError(e.toString()));
    }
  }

}
