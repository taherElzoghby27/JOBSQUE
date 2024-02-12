import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/api_service.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo.dart';

import '../models/notification.dart';

class NotificationRepoImplementation extends NotificationRepo {
  ApiService apiService;

  NotificationRepoImplementation({required this.apiService});

  @override
  Future<Either<FailureServ, NotificationModel>> getNotification({
    required String id,
  }) async {
    try {
      //response
      Map<String, dynamic> result = await apiService.get(
        path: '${ApiConsts.getNotificationEndPoint}/$id',
      );
      //convert data from Map to Notification
      NotificationModel notification =
          NotificationModel.fromJson(result['data']);
      return Right(notification);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
