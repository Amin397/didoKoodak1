import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShopController extends GetxController{
  TextEditingController searchController = TextEditingController();

  void goToProductList({required String title}) {
    Get.toNamed(NameRouts.productList ,arguments: {
      'title':title,
    });
  }


}