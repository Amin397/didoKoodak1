import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Utils/rout_utils.dart';

class SingleHomeController extends GetxController{



  RxInt currentPage  = 0.obs;
  late PageController pageController;


  @override
  void onInit() {
    currentPage.value = Get.arguments['page'];
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  void changedPage({required int page}) {

  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }
}