import 'package:dido_koodak1/Utils/shakeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/IceCreamGame/ice_cream_material_model.dart';

class IceCreamGameController extends GetxController {
  RxInt heartNumber = 3.obs;
  late GlobalKey<CustomShakeWidgetState> heart;

  List<IceCreamMaterialModel> iceCreamMaterial = [
    IceCreamMaterialModel(
      id: 0,
      title: 'bread1',
      path: 'assets/images/IceCream/bread1.svg',
    ),
    IceCreamMaterialModel(
      id: 1,
      title: 'bread2',
      path: 'assets/images/IceCream/bread2.svg',
    ),
    IceCreamMaterialModel(
      id: 2,
      title: 'brownCream',
      path: 'assets/images/IceCream/brownCream.svg',
    ),
    IceCreamMaterialModel(
      id: 3,
      title: 'yellowCream',
      path: 'assets/images/IceCream/yellowCream.svg',
    ),
    IceCreamMaterialModel(
      id: 4,
      title: 'purpleCream',
      path: 'assets/images/IceCream/purpleCream.svg',
    ),
    IceCreamMaterialModel(
      id: 5,
      title: 'greenCream',
      path: 'assets/images/IceCream/greenCream.svg',
    ),
    IceCreamMaterialModel(
      id: 6,
      title: 'littleStar',
      path: 'assets/images/IceCream/littleStar.svg',
    ),
    IceCreamMaterialModel(
      id: 7,
      title: 'bigStar',
      path: 'assets/images/IceCream/bigStar.svg',
    ),
    IceCreamMaterialModel(
      id: 8,
      title: 'lollipop',
      path: 'assets/images/IceCream/lollipop.svg',
    ),
    IceCreamMaterialModel(
      id: 9,
      title: 'strawberry',
      path: 'assets/images/IceCream/strawberry.svg',
    ),
  ];

  List<IceCreamMaterialModel> orderList = [];

  @override
  void onInit() {
    heart = GlobalKey();
    super.onInit();
  }

  @override
  void dispose() {
    heart.currentState!.dispose();
    super.dispose();
  }

  void createOrder({required IceCreamMaterialModel item}) {
    if (orderList.isEmpty) {
      if (item.id == 0 || item.id == 1) {
        orderList.add(item);
      }
    } else {
      if (orderList.length < 4) {
        if (item.id == 2 || item.id == 3 || item.id == 4 || item.id == 5) {
          orderList.add(item);
        }
      } else {
        if (item.id == 6 || item.id == 7 || item.id == 8 || item.id == 9) {
          orderList.add(item);
        }
      }
    }
    update(['createOrder']);
  }
}
