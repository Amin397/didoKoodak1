import 'package:get/get.dart';

import '../../Utils/rout_utils.dart';

class ParentPanelController extends GetxController {
  void goToHome() {
    Get.offAndToNamed(
      NameRouts.home,
    );
  }

  void goToReportScreen() {
    Get.toNamed(
      NameRouts.report,
    );
  }
}
