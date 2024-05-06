import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CustomerData {
  CustomerData({
    required this.receiverName,
    required this.name,
    required this.location,
    required this.frequency,
    required this.dateTime,
  }) : id = uuid.v4();

  String name;
  String id;
  String receiverName;
  String location;
  int frequency;
  String dateTime;

  String formatDateTime() {
    final parsedDate = DateFormat('d-MMM-yyyy').parse(dateTime);
    final formattedDate = DateFormat.d().format(parsedDate);
    return formattedDate;
  }
}
