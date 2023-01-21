import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/Setting/setting_model.dart';
import '../../Utils/rout_utils.dart';

class SettingController extends GetxController {
  RxInt step = 0.obs;
  RxInt status = 0.obs;
  RxInt semiStatus = 0.obs;
  RxBool isLogin = true.obs;
  RxBool isLogicAccepted = true.obs;
  List<SettingModel> settingList = [
    SettingModel(title: 'صدا', isSwitched: false.obs, id: 0),
    SettingModel(title: 'موسیقی', isSwitched: false.obs, id: 1),
    SettingModel(title: 'اعلانات', isSwitched: true.obs, id: 2),
  ];
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() async {
    settingList[1].isSwitched(Blocs.musicBloc.player.playing);
  }

  void buttonsAction({
    required int id,
  }) {
    switch(id){
      case 0:{
        Get.offAllNamed(NameRouts.home);
        break;
      }
      case 1:{
        semiStatus(1);
        step(step.value + 1);
        break;
      }
      default:{
        Get.back();
      }
    }
  }

  void backMethod() {
    if (status.value == 1) {
      status(0);
      step(step.value - 1);
    } else {
      if (step.value == 0) {
        buttonsAction(id: 0);
      } else {
        step(step.value - 1);
        if (semiStatus.value == 1) {
          semiStatus(0);
        }
      }
    }
  }

  void switchToggle({
    required SettingModel setting,
  }) {
    if (setting.id == 1) {
      if (setting.isSwitched.isTrue) {
        Blocs.musicBloc.offMusic(setOff: true);
        StorageUtils.setBgMusic(play: false);
      } else {
        Blocs.musicBloc.offMusic(setOff: false);
        StorageUtils.setBgMusic(play: true);
        // Blocs.musicBloc.init();
      }
    }
    setting.isSwitched(!setting.isSwitched.value);
  }

  void goToLoginRegister() {
    status(1);
    step(step.value + 1);
  }

  void switchToRegister() {
    userNameController.clear();
    passwordController.clear();
    rePasswordController.clear();
    phoneNumberController.clear();
    isLogin(!isLogin.value);
  }

  void logicChecked({required dynamic value}) {
    isLogicAccepted(value);
  }

  void loginButton() {

    if(isLogin.isTrue){
      Get.toNamed(
        NameRouts.parentPanel,
      );
    }else{
      Get.toNamed(
        NameRouts.kidsProfile,
      );
    }

  }
}
