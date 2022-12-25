import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../Utils/rout_utils.dart';
import '../../View/SingleHome/Widgets/build_pod_casts.dart';

class SingleHomeController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;


  AudioPlayer player = AudioPlayer();

  @override
  void onInit() {
    currentPage.value = Get.arguments['page'];
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  void changedPage({required int page}) {}

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToGamesList() {
    Get.toNamed(NameRouts.gamesList);
  }

  void goToSingleTower() {
    Get.toNamed(NameRouts.singleTower);
  }

  void showModal() async {



    await player.setUrl('http://192.168.88.221:8096/Items/3e65cd1fa54b3d351971ac4ee13ad038/Download?api_key=9a68a3eaf1394afeabb2ee30d4ad5f4a');
    // await player.play();


    await showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) =>BuildPodCasts(
        controller:this
      ),
    );
    player.dispose();
  }
}
