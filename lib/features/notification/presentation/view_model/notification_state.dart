part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

//loading
class NotificationLoading extends NotificationState {}

//success
class NotificationSuccess extends NotificationState {
  final NotificationModel notificationModel;

  NotificationSuccess({required this.notificationModel});

}

//failure
class NotificationFailure extends NotificationState {
  final String message;

  NotificationFailure({required String this.message});
}
