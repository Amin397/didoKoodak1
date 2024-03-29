import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:dido_koodak1/Utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../View/Home/Widgets/exit_alert.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  void goToAnimalInfo() {
    Get.toNamed(NameRouts.animalInfo);
  }

  void goToAnimalGame() {
    Get.toNamed(NameRouts.animalGame);
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToSingleHome({required int id}) {
    switch(id){
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
    Get.toNamed(NameRouts.singleHome, arguments: {
      'page': id,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      Blocs.musicBloc.offMusic(setOff: true);
    } else {
      Blocs.musicBloc.offMusic(setOff: false);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onInit() {
    playWelcomeCatSound();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setInitBgMusic();
    });
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  playWelcomeCatSound() {
    Blocs.catSoundBloc.init(soundId: 0);
  }

  void setInitBgMusic() async {
    StorageUtils.getBgMusic().then((value) {
      print(value);
      if (value is bool) {
        if (value) {
          if (!Blocs.musicBloc.player.playing) {
            Blocs.musicBloc.init();
          }
        }
      } else {
        StorageUtils.setBgMusic(play: true).then((value) {
          Blocs.musicBloc.init();
        });
      }
    });

    // print(Blocs.musicBloc.player.playing);
    // if (!Blocs.musicBloc.player.playing) {
    //   StorageUtils.getBgMusic().then((value) {
    //     print(value);
    //     // if (!value) {
    //     //   Blocs.musicBloc.player.play();
    //     // }
    //   });
    // }
  }

  void showExitAlert() async {
    bool exit = await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: ExitAlert(),
        );
      },
    );

    if (exit) {
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      SystemNavigator.pop();
    }
  }
}
