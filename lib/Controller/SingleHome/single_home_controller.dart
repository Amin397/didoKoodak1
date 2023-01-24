import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../Utils/rout_utils.dart';
class SingleHomeController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    currentPage.value = Get.arguments['page'];
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  void changedPage({required int page}) {
    currentPage(page);
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToGamesList() {
    Get.toNamed(NameRouts.gamesList);
  }

  void goToSingleTower() {
    Get.toNamed(NameRouts.singleTower);
  }

  void goToSinglePodcast() {
    Get.toNamed(NameRouts.singlePodcast);
  }

  @override
  void onClose() {
    currentPage(0);
    super.onClose();
  }

  @override
  void dispose() {
    currentPage(0);
    super.dispose();
  }

  void goToIceCreamGame() {
    Get.toNamed(NameRouts.iceCreamGame);
  }

  void goToShop() {
    Get.toNamed(NameRouts.shop);
  }
}
