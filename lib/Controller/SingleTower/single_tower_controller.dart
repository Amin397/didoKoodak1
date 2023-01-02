import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';

class SingleTowerController extends GetxController {
  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToSingleMovie({required String videoPath}) {
    Get.toNamed(NameRouts.singleMovie, arguments: {
      'path': videoPath,
    });
  }

  void goToSingleFlore({required int flore}) {
    Get.toNamed(NameRouts.singleFlore , arguments: {
      'flore':flore,
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}
