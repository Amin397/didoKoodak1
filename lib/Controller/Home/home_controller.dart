import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
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
    Get.toNamed(NameRouts.singleHome , arguments: {
      'page':id,
    });
  }

}

