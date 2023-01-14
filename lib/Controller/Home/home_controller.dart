import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:dido_koodak1/Utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController with WidgetsBindingObserver{
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
    print(id);
    Get.toNamed(NameRouts.singleHome, arguments: {
      'page': id,
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
      Blocs.musicBloc.offMusic(setOff: true);
    }else{
      Blocs.musicBloc.offMusic(setOff: false);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onInit() {
    setInitBgMusic();
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
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



}
