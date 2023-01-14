import 'dart:async';
import 'dart:math';

import 'package:dido_koodak1/Utils/shakeAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/IceCreamGame/ice_cream_customer_model.dart';
import '../../Model/IceCreamGame/ice_cream_material_model.dart';
import '../../View/AlphabetGame/Widgets/alphabet_game_over_alert_dialog.dart';
import '../../View/IceCreamGame/Widget/ice_cream_game_over_alert_dialog.dart';

class IceCreamGameController extends GetxController {
  RxInt heartNumber = 3.obs;
  late final GlobalKey<CustomShakeWidgetState> heart;

  late final GlobalKey<AnimatedListState> keys;

  Timer? randomCustomerRandomTimer;
  List<IceCreamOrderModel> customerOrderedList = [];

  List<IceCreamCustomerModel> customerList = [
    IceCreamCustomerModel(
      id: 0,
      imgPath: 'assets/images/IceCream/boy1.svg',
    ),
    IceCreamCustomerModel(
      id: 1,
      imgPath: 'assets/images/IceCream/boy2.svg',
    ),
    IceCreamCustomerModel(
      id: 2,
      imgPath: 'assets/images/IceCream/girl1.svg',
    ),
    IceCreamCustomerModel(
      id: 3,
      imgPath: 'assets/images/IceCream/girl2.svg',
    ),
  ];

  List<IceCreamMaterialModel> breadList = [
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
  ];

  List<IceCreamMaterialModel> creamList = [
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
  ];

  List<IceCreamMaterialModel> materialList = [
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

  List<IceCreamMaterialModel> iceCreamMaterialList = [];

  @override
  void onInit() {
    super.onInit();
    heart = GlobalKey();
    keys = GlobalKey();

    firstInit();
    randomCustomerRandomTimer =
        Timer.periodic(const Duration(seconds: 20), (timer) {
      createRandomCustomer();
    });
  }

  void createOrder({required IceCreamMaterialModel item}) {
    print(item.id);
    if (iceCreamMaterialList.isEmpty) {
      if (item.id == 0 || item.id == 1) {
        iceCreamMaterialList.add(item);
      }
    } else {
      if (iceCreamMaterialList.length < 4) {
        if (item.id == 2 || item.id == 3 || item.id == 4 || item.id == 5) {
          iceCreamMaterialList.add(item);
        }
      } else {
        if (iceCreamMaterialList.length != 5) {
          if (item.id == 6 || item.id == 7 || item.id == 8 || item.id == 9) {
            iceCreamMaterialList.add(item);
          }
        }
      }
    }
    update(['createOrder']);
  }

  void getBackItem() {
    if (iceCreamMaterialList.isNotEmpty) {
      iceCreamMaterialList.removeLast();
      update(['createOrder']);
    }
  }

  void createRandomCustomer() async {
    customerList.shuffle();

    IceCreamOrderModel model = IceCreamOrderModel(
      customer: customerList.first,
      order: [
        Random().nextInt(2),
        2 + Random().nextInt(4),
        2 + Random().nextInt(4),
        2 + Random().nextInt(4),
        6 + Random().nextInt(4),
      ],
      color: (Random().nextDouble() * 0xFFFFFF).toInt(),
    );

    customerOrderedList.insert(
      0,
      model,
    );

    keys.currentState!.insertItem(0, duration: const Duration(seconds: 1));
    update(['createCustomer']);
  }

  void removeCustomer({required int index}) {
    customerOrderedList.removeAt(index);
    keys.currentState!.removeItem(
      index,
      (context, animation) => SizedBox(),
      duration: const Duration(seconds: 1),
    );
    update(['createCustomer']);
  }

  void firstInit() {
    Future.delayed(const Duration(seconds: 3), () {
      IceCreamOrderModel model = IceCreamOrderModel(
        customer: customerList.first,
        order: [
          Random().nextInt(2),
          2 + Random().nextInt(4),
          2 + Random().nextInt(4),
          2 + Random().nextInt(4),
          6 + Random().nextInt(4),
        ],
        color: (Random().nextDouble() * 0xFFFFFF).toInt(),
      );

      customerOrderedList.insert(
        0,
        model,
      );
      keys.currentState!.insertItem(0, duration: const Duration(seconds: 1));
      update(['createCustomer']);
    });
  }

  void checkIceCream(
      {required IceCreamOrderModel item,
      required int index,
      required Animation<double> animation}) {
    if (listEquals(
        item.order, iceCreamMaterialList.map((e) => e.id).toList())) {
      removeCustomer(
        index: index,
      );

      iceCreamMaterialList = [];
      update(['createOrder']);
    } else {
      heartNumber(heartNumber.value - 1);
      if (heartNumber.value == 0) {
        showGameOverAlert();
      } else {
        heart.currentState!.shake();
      }
    }
  }


  void showGameOverAlert() async {
    randomCustomerRandomTimer!.cancel();
    var replay = await showGeneralDialog(
      context: Get.context!,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: const AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: IceCreamGameOverAlertDialog(),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 370),
    );

    if(replay is bool && replay){

      iceCreamMaterialList = [];
      customerOrderedList = [];
      update(['createCustomer']);
      update(['createOrder']);
      heartNumber(3);
      firstInit();
      randomCustomerRandomTimer =
          Timer.periodic(const Duration(seconds: 20), (timer) {
            createRandomCustomer();
          });
    }else{
      Get.back();
    }
  }



  @override
  void onClose() {
    print(keys.currentState);
    // heart.currentState!.dispose();
    super.onClose();
  }



}
