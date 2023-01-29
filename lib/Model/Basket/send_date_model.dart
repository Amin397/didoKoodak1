import 'package:get/get.dart';

class SendDateModel {
  String day;
  String date;
  RxInt groupSendTimeValue;
  RxBool isSelected;
  List<TimeOfDayModel> timeOfDay;

  SendDateModel({
    required this.day,
    required this.date,
    required this.isSelected,
    required this.groupSendTimeValue,
    required this.timeOfDay,
  });
}


class TimeOfDayModel{

  int value;
  String title;

  TimeOfDayModel({required this.value, required this.title});
}
