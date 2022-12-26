import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              const SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image(
                  image: AssetImage(
                    'assets/images/Backgrounds/splashBg.PNG',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: (controller.isStarted.isTrue)
                      ? Get.height * .1
                      : -Get.height * .6,
                  child: InkWell(
                    onTap: (){
                      controller.goToHome();
                    },
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * .8,
                      child: const Image(
                        image: AssetImage(
                          'assets/images/didoLogo.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1500),
                  // switchInCurve: Curves.fastLinearToSlowEaseIn,
                  child: (controller.isStarted.isTrue)
                      ? _buildLoading()
                      : const SizedBox(),
                ),
              ),

              // Obx(
              //   () => (controller.isStarted.isTrue)
              //       ? _buildLoading()
              //       : const SizedBox(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Lottie.asset(
        'assets/anims/loading.json',
        height: Get.height * .25,
        width: Get.height * .25,
      ),
    );
  }
}
