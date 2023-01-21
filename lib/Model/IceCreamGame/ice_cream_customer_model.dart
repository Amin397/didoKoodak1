import 'dart:async';

import 'package:get/get.dart';

class IceCreamCustomerModel {
  String happyImgPath;
  String sadImgPath;
  int id;


  // List<IceCreamMaterialModel> order;

  IceCreamCustomerModel({
    required this.happyImgPath,
    required this.sadImgPath,
    required this.id,

  });
}

class IceCreamOrderModel {
  IceCreamCustomerModel customer;
  List<int> order;
  int color;
  RxBool isCatch;
  Timer? timer;
  int duration;
  String? mainImage;


  IceCreamOrderModel({
    required this.customer,
    required this.order,
    required this.color,
    required this.isCatch,
    this.mainImage,
    this.timer,
    required this.duration,
  });
}
