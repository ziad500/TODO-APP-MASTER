import 'package:intl/intl.dart';

String formatDateTime(String dateString) {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateFormat outputFormat = DateFormat('d MMM y, EEEE');

  DateTime dateTime = inputFormat.parse(dateString);
  String formattedDate = outputFormat.format(dateTime);

  return formattedDate;
}

String formatTime(String dateTimeString) {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS');
  DateFormat outputFormat = DateFormat('hh:mm a');

  DateTime dateTime = inputFormat.parse(dateTimeString);
  String formattedTime = outputFormat.format(dateTime);

  return formattedTime;
}
