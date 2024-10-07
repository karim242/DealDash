import 'package:intl/intl.dart';

String formatDate(String dateTimeString) {
  DateTime parsedDate = DateTime.parse(dateTimeString);
  
  String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  
  return formattedDate;
}