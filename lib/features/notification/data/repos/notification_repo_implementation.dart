import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/errors/failure_message.dart';
import 'package:jobsque/core/services/api_service/api_service.dart';
import 'package:jobsque/features/notification/data/repos/notification_repo.dart';

import '../models/notification.dart';

class NotificationRepoImplementation extends NotificationRepo {
  ApiService apiService;

  NotificationRepoImplementation({required this.apiService});

  @override
  Future<Either<FailureMessage, NotificationModel>> getNotification({
    required String id,
  }) async {
    try {
      //response
      http.Response result = await apiService.get(
        path: '${ApiConsts.getNotificationEndPoint}/$id',
      );
      //convert data from json to map
      Map<String, dynamic> data = jsonDecode(result.body);
      //success
      if (result.statusCode == 200) {
        //convert data from Map to Notification
        NotificationModel notification =
            NotificationModel.fromJson(data['data']);
        print(notification);
        return Right(notification);
      } else if (result.statusCode == 401) {
        //failure
        return Left(FailureMessage(message: result.body.toString()));
      }
    } catch (e) {
      //failure
      return Left(FailureMessage(message: e.toString()));
    }
    return Left(FailureMessage(message: 'something error'));
  }
}
