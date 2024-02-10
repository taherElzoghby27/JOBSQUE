import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_message.dart';
import '../models/notification.dart';

abstract class NotificationRepo {
  //get notifications
  Future<Either<Failure, NotificationModel>> getNotification({required String id});
}
