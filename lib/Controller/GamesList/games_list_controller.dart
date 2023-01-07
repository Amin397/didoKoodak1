import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamesListController extends GetxController {
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {


    Future.delayed(const Duration(seconds: 1) , (){
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration:const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    });
    super.onInit();
  }

  void goToAlphabetGame() {
    Get.toNamed(NameRouts.selectAlphabetGame);
  }

  void goToAnimalInfo() {
    Get.toNamed(NameRouts.animalInfo);
  }

  void goToAnimalGame() {
    Get.toNamed(NameRouts.animalGame);
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }
}
