import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/FloreModel/flore_two_model.dart';
import '../../Utils/rout_utils.dart';

class SingleRoomController extends GetxController{
  List<VideoModel> videosList = [];

  late PageController pageController;

  RxInt currentPage = 1.obs;


  @override
  void onInit() {
    pageController = PageController(
      initialPage: currentPage.value,
      viewportFraction: 1/3,
    );

    initList();
    super.onInit();
  }

  void initList() {

    videosList = Get.arguments['videos'];
  }

  void changePage({required int page}) {
    currentPage(page);
  }

  void goToVideo({required String videoPath}) {
    Get.toNamed(NameRouts.singleMovie, arguments: {
      'path': videoPath,
    });
  }


}