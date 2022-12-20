import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/SingleTower/single_tower_controller.dart';

class SingleTowerScreen extends StatelessWidget {
  SingleTowerScreen({Key? key}) : super(key: key);

  final SingleTowerController controller = Get.put(SingleTowerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 2,
                    width: Get.width,
                    child: Stack(
                      children: [
                        const SizedBox(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: Image(
                            image: AssetImage(
                              'assets/images/Backgrounds/single_tower_bg.PNG',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),

                        _buildFirstTowerPart(),
                        _buildSecondTowerPart(),
                        _buildLastTowerPart()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSettingButton(),
            _buildHomeButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          controller.goToSetting();
          // controller.pageController.previousPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
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

  Widget _buildHomeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          Get.offAndToNamed(NameRouts.home);
          // controller.pageController.nextPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
        },
        child: Container(
          margin: paddingAll28,
          height: Get.height * .1,
          width: Get.height * .1,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/homeButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * .65,
        height: Get.height * .25,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .1,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .02,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            Flexible(
              flex: 5,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .015,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * .6,
        height: Get.height * .25,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .44,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .005,
            ),
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .005,
            ),
            Flexible(
              flex: 5,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,

                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                    SizedBox(
                      width: Get.width * .015,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * .6,
        height: Get.height * .2,
        // color: Colors.red,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .8,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          controller.goToSingleMovie();
                        },
                        child: Container(
                          color: Colors.red,
                          height: double.maxFinite,
                          width: double.maxFinite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .005,
            ),
            Flexible(
              flex: 6,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .005,
            ),
            Flexible(
              flex: 5,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,

                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,

                      ),
                    ),
                    SizedBox(
                      width: Get.width * .015,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}