import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/notification/data/models/notification.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationRepo notificationRepo;

  NotificationCubit({required this.notificationRepo})
      : super(NotificationInitial());

  //get notification
  getNotification({required String id}) async {
    Either<FailureMessage, NotificationModel> notification =
        await notificationRepo.getNotification(id: '1');
    emit(NotificationLoading());
    notification.fold(
      (fail) {
        emit(
          NotificationFailure(message: fail.message),
        );
      },
      (notification) {
        emit(NotificationSuccess(notificationModel: notification));
      },
    );
  }
}
