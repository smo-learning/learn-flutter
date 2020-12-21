import 'package:intl/intl.dart';

class ChartDay {
  String weekDay;
  double totalAmount;

  ChartDay(DateTime weekDay, double totalAmount) {
    this.weekDay = DateFormat.E().format(weekDay).substring(0, 1);
    this.totalAmount = totalAmount;
  }
}
