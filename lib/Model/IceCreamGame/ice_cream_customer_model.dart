import 'package:flutter/material.dart';

class IceCreamCustomerModel {
  String imgPath;
  int id;

  // List<IceCreamMaterialModel> order;

  IceCreamCustomerModel({required this.imgPath, required this.id});
}

class IceCreamOrderModel {
  IceCreamCustomerModel customer;
  List<int> order;
  int color;

  IceCreamOrderModel({
    required this.customer,
    required this.order,
    required this.color,
  });
}
