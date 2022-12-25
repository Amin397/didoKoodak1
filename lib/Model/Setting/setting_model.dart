import 'package:get/get.dart';

class SettingModel{

  SettingModel({required this.title, required this.isSwitched , required this.id});

  int id;
  String title;
  RxBool isSwitched;

}