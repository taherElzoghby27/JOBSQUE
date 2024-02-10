import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'badCertification with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
          error.response!.statusCode!,
          error.response,
        );
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to ApiServer was Canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          message: 'Opps There was an Error, Please try again',
        );
    }
  }
  factory ServerFailure.fromDioResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        message: 'Your request was not found, please try later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        message: 'There is a problem with server,please try later',
      );
    }
    return ServerFailure(message: 'there was an error, please try again');
  }
}
