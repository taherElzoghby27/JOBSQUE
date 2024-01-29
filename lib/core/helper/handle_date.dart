import 'package:intl/intl.dart';

//handle date
List<String> handleDate({required String date}) {
  String dateTime = DateFormat.yMd().add_jm().format(
        convertStringToDateTime(date),
      );
  List<String> dt = dateTime.split(' ');
  print(dt);
  return dt;
}

//convert String To DateTime
DateTime convertStringToDateTime(String date) => DateTime.parse(date);
