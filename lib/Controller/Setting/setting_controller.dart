import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Model/Setting/setting_model.dart';

class SettingController extends GetxController {
  RxInt step = 0.obs;

  RxInt status = 0.obs;
  RxInt semiStatus = 0.obs;

  List<SettingModel> settingList = [
    SettingModel(
      title: 'صدا',
      isSwitched: false.obs,
    ),
    SettingModel(
      title: 'موسیقی',
      isSwitched: false.obs,
    ),
    SettingModel(title: 'اعلانات', isSwitched: true.obs),
  ];

  void buttonsAction({required int id}) {
    if (id == 0) {
      Get.back();
      dispose();
    } else {
      print('amin');
      semiStatus(1);
      step(step.value + 1);
    }
  }

  void backMethod() {
    if (step.value == 0) {
      buttonsAction(id: 0);
    } else {
      step(step.value - 1);
      if(semiStatus.value == 1){
        semiStatus(0);
      }

    }
  }

  void switchToggle({
    required SettingModel setting,
  }) {
    setting.isSwitched(!setting.isSwitched.value);
  }
}
