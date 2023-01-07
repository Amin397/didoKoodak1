import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SingleTowerController extends GetxController {
  ScrollController scrollerController = ScrollController();


  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1) , (){
      scrollerController.animateTo(
        scrollerController.position.maxScrollExtent,
        duration:const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    });
    super.onInit();
  }


  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToSingleMovie({required String videoPath}) {
    Get.toNamed(NameRouts.singleMovie, arguments: {
      'path': videoPath,
    });
  }

  void goToSingleFlore({required int flore}) {
    Get.toNamed(NameRouts.singleFlore , arguments: {
      'flore':flore,
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}
