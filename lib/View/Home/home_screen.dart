import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            // InteractiveViewer(
            //   panEnabled: false,
            //   boundaryMargin: paddingAll24,
            //   minScale: 1.0,
            //   maxScale: 4.0,
            //   child: _buildBg(),
            // ),
            _buildBg(),
            _buildSettingButton(),
            _buildClickableTowerItem(),
            _buildClickableCarouselItem(),
            _buildClickableTrainItem(),
            _buildClickableTentItem(),
          ],
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextButton(
        //       onPressed: () {
        //         controller.goToAnimalInfo();
        //       },
        //       child: const Text(
        //         'animals info',
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         controller.goToAnimalGame();
        //       },
        //       child: const Text(
        //         'animals game',
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //       },
        //       child: const Text(
        //         'settings',
        //       ),
        //     ),
        //
        //   ],
        // ),
      ),
    );
  }

  Widget _buildBg() {
    return const SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Image(
        image: AssetImage(
          'assets/images/Backgrounds/homeBg.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildSettingButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          controller.goToSetting();
        },
        child: Container(
          margin: paddingAll28,
          height: Get.height * .1,
          width: Get.height * .1,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/settingButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClickableTowerItem() {
    return Positioned(
      bottom: Get.height * .15,
      left: Get.width * .12,
      child: InkWell(
        onTap: () {
          controller.goToSingleHome(id: 0);
        },
        child: Transform.rotate(
          angle: -.2,
          child: SizedBox(
            height: Get.height * .35,
            width: Get.height * .55,
          ),
        ),
      ),
    );
  }

  Widget _buildClickableCarouselItem() {
    return Positioned(
      bottom: Get.height * .28,
      left: Get.width * .375,
      child: InkWell(
        onTap: () {
          controller.goToSingleHome(id: 1);
        },
        child: Container(
          height: Get.height * .4,
          width: Get.height * .4,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildClickableTrainItem() {
    return Positioned(
      bottom: Get.height * .16,
      left: Get.width * .45,
      child: InkWell(
        onTap: () {
          controller.goToSingleHome(id: 2);
        },
        child: SizedBox(
          height: Get.height * .15,
          width: Get.width * .25,
        ),
      ),
    );
  }

  Widget _buildClickableTentItem() {
    return Positioned(
      bottom: Get.height * .14,
      right: Get.width * .15,
      child: InkWell(
        onTap: () {
          controller.goToSingleHome(id: 2);
        },
        child: Transform.rotate(
          angle: .2,
          child: SizedBox(
            height: Get.height * .25,
            width: Get.width * .14,
          ),
        ),
      ),
    );
  }
}
