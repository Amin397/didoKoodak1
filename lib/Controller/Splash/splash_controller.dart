import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isStarted = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      isStarted(true);
    });

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(
        NameRouts.home,
      );
    });
    super.onInit();
  }
}
