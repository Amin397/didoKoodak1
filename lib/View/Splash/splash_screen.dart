import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/Splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
            Center(
              child: SizedBox(
                width: Get.width * .5,
                height: Get.height * .8,
                child: SvgPicture.asset('assets/images/didoLogo.svg'),
              ),
            ),
            Obx(
              () => (controller.isStarted.isTrue)
                  ? _buildLoading()
                  : const SizedBox(),
            ),
          ],
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

  Widget _buildImage({
    required String path,
    required double height,
    required double width,
    required EdgeInsets padding,
  }) {
    return Obx(
      () => (controller.isStarted.isTrue)
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: padding,
                child: SvgPicture.asset(
                  path,
                  height: height,
                  width: width,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
