import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

import '../../Globals/blocs.dart';
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

    Blocs.catSoundBloc.player.dispose();
    Future.delayed(const Duration(milliseconds: 200) , (){
      switch(currentPage.value){
        case 0:{
          Blocs.catSoundBloc.init(soundId: 1);
          break;
        }
        case 1:{
          Blocs.catSoundBloc.init(soundId: 3);
          break;
        }
        case 2:{
          Blocs.catSoundBloc.init(soundId: 7);
          break;
        }
      }
    });
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToGamesList() {
    Blocs.catSoundBloc.player.dispose();
    Future.delayed(const Duration(milliseconds: 200) , (){
      Blocs.catSoundBloc.init(soundId: 8);
    });
    Get.toNamed(NameRouts.gamesList);
  }

  void goToSingleTower() {
    Blocs.catSoundBloc.player.dispose();
    Future.delayed(const Duration(milliseconds: 200) , (){
      Blocs.catSoundBloc.init(soundId: 2);
    });
    Get.toNamed(NameRouts.singleTower);
  }

  void goToSinglePodcast() {
    Blocs.catSoundBloc.player.dispose();
    Future.delayed(const Duration(milliseconds: 200) , (){
      Blocs.catSoundBloc.init(soundId: 4);
    });
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
    Blocs.catSoundBloc.init(soundId: 5);
    Get.toNamed(NameRouts.iceCreamGame);
  }

  void goToShop() {
    Blocs.catSoundBloc.init(soundId: 6);
    Get.toNamed(NameRouts.shop);
  }
}
