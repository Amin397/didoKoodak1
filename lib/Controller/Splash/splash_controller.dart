import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isStarted = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      isStarted(true);
    });
    // initMusic();
    super.onInit();
  }



  void goToHome(){

    initMusic();

    Get.toNamed(
      NameRouts.home,
    );
  }

  void initMusic() async{
    Blocs.musicBloc.init();
      Blocs.musicBloc.player.play();
    // Future.delayed(const Duration(seconds: 2) , (){
    // });
  }
}
