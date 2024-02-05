import 'package:http/http.dart' as http;

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class FailureMessage extends Failure {
  FailureMessage({required super.message});

  factory FailureMessage.fromHttpError(http.Response response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return FailureMessage(message: 'Unauthorised: ${response.body}');
      case 404:
        return FailureMessage(
          message: 'Your request was not found, please try later',
        );
      case 500:
      default:
        return FailureMessage(
          message:
              'Error During Communication: Error occured while Communication with Server',
        );
    }
  }

  factory FailureMessage.fromJson(Map<String, dynamic> json) {
    return FailureMessage(
        message: (json['massege'] is String
            ? json['massege']
            : json['massege']['email'][0]) as String);
  }
}
