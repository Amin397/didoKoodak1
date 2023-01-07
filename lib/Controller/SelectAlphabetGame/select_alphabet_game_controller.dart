import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';

class SelectAlphabetGameController extends GetxController{
  void goToSingleItem({required int id}) {
    if(id == 0){
      Get.toNamed(NameRouts.alphabetInfo);
    }else{
      Get.toNamed(NameRouts.alphabetGame);
    }
  }
}