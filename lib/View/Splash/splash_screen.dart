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
            InkWell(
              onTap: () {
                controller.goToHome();
              },
              child: Center(
                child: SizedBox(
                  width: Get.width * .5,
                  height: Get.height * .8,
                  child: SvgPicture.asset('assets/images/didoLogo.svg'),
                  // child: const Image(
                  //   image: AssetImage(
                  //     'assets/images/didoLogo.png',
                  //   ),
                  // ),
                ),
              ),
            ),
            // Obx(
            //   () => AnimatedPositioned(
            //     duration: const Duration(milliseconds: 500),
            //     bottom: (controller.isStarted.isTrue)
            //         ? Get.height * .1
            //         : -Get.height * .6,
            //     child: InkWell(
            //       onTap: () {
            //         controller.goToHome();
            //       },
            //       child: SizedBox(
            //         width: Get.width * .5,
            //         height: Get.height * .8,
            //         child: SvgPicture.asset('assets/images/didoLogo.svg'),
            //         // child: const Image(
            //         //   image: AssetImage(
            //         //     'assets/images/didoLogo.png',
            //         //   ),
            //         // ),
            //       ),
            //     ),
            //   ),
            // ),

            // _buildImage(
            //     path: 'assets/images/Characters/shoshoJump.png',
            //     height: Get.height * .4,
            //     width: Get.width * .25,
            //     padding: EdgeInsets.only(
            //       bottom: Get.height * .1,
            //       right: Get.width * .25,
            //     )),
            // _buildImage(
            //     path: 'assets/images/Characters/krok.png',
            //     height: Get.height * .3,
            //     width: Get.width * .2,
            //     padding: EdgeInsets.only(
            //       bottom: Get.height * .1,
            //       left: Get.width * .3,
            //     )),
            // _buildImage(
            //     path: 'assets/images/Characters/ihihi.png',
            //     height: Get.height * .3,
            //     width: Get.width * .2,
            //     padding: EdgeInsets.only(
            //       bottom: Get.height * .1,
            //       left: Get.width * .05,
            //     )),
            // _buildImage(
            //     path: 'assets/images/Characters/pospos.png',
            //     height: Get.height * .2,
            //     width: Get.width * .1,
            //     padding: EdgeInsets.only(
            //       bottom: Get.height * .05,
            //       right: Get.width * .05,
            //     )),
            // _buildImage(
            //     path: 'assets/images/Characters/cat.png',
            //     height: Get.height * .35,
            //     width: Get.width * .15,
            //     padding: EdgeInsets.only(
            //       // bottom: Get.height * .01,
            //       left: Get.width * .75,
            //     )),
            // _buildImage(
            //     path: 'assets/images/Characters/radinJump.png',
            //     height: Get.height * .5,
            //     width: Get.width * .25,
            //     padding: EdgeInsets.only(
            //       bottom: Get.height * .05,
            //       left: Get.width * .5,
            //     )),
            // _buildImage(path: ''),
            // _buildImage(path: ''),
            // _buildImage(path: ''),
            // _buildImage(path: ''),
            // _buildImage(path: ''),

            // Obx(
            //   () => AnimatedSwitcher(
            //     duration: const Duration(milliseconds: 1500),
            //     // switchInCurve: Curves.fastLinearToSlowEaseIn,
            //     child: (controller.isStarted.isTrue)
            //         ? _buildLoading()
            //         : const SizedBox(),
            //   ),
            // ),

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
                child: Image(
                  image: AssetImage(
                    path,
                  ),
                  height: height,
                  width: width,
                  fit: BoxFit.contain,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
