import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';

class GamesListController extends GetxController{
  void goToAlphabetGame() {
    Get.toNamed(NameRouts.alphabetGame);
  }


  void goToAnimalInfo() {
    Get.toNamed(NameRouts.animalInfo);
  }

  void goToAnimalGame() {
    Get.toNamed(NameRouts.animalGame);

  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }


}