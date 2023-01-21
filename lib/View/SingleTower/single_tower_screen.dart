import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              controller: controller.scrollerController,
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
                              'assets/images/Backgrounds/singleTowerBg.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: Get.width * .8,
                            height: Get.height * 1.2,
                            child: Column(
                              children: [
                                _buildFirstTowerPart(),
                                _buildSecondTowerPart(),
                                _buildLastTowerPart()
                              ],
                            ),
                          ),
                        ),
                        buildSitCat(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSettingButton(),
            _buildHomeButton(),
            _buildBackButton(),
          ],
        ),
      ),
    );
  }

  Widget buildSitCat() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .8,
        ),
        height: Get.height * .35,
        width: Get.width * .17,
        child: SvgPicture.asset('assets/images/Characters/sitCat.svg'),
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
          height: Get.height * .14,
          width: Get.height * .14,
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
        },
        child: Container(
          margin: paddingAll28,
          height: Get.height * .14,
          width: Get.height * .14,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/homeButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 28.0,
            vertical: Get.height * .22,
          ),
          height: Get.height * .14,
          width: Get.height * .14,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/backButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          print('flore 2');
          controller.goToSingleFlore(
            flore: 2,
          );
        },
        child: Container(
          width: Get.width * .65,
          height: Get.height * .25,
          margin: EdgeInsets.only(
            top: Get.height * .08,
          ),
        ),
      ),
    );
  }

  Widget _buildSecondTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          print('flore 1');
          controller.goToSingleFlore(
            flore: 1,
          );
        },
        child: Container(
          width: Get.width * .6,
          height: Get.height * .25,
          margin: EdgeInsets.only(
            top: Get.height * .15,
          ),
        ),
      ),
    );
  }

  Widget _buildFirstTowerPart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          print('flore 0');
          controller.goToSingleFlore(
            flore: 0,
          );
        },
        child: Container(
          width: Get.width * .6,
          height: Get.height * .2,
          margin: EdgeInsets.only(
            top: Get.height * .18,
          ),
        ),
      ),
    );
  }
}
