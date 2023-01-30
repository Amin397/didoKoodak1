import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Home/home_controller.dart';
import '../../Globals/blocs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.showExitAlert();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              _buildBg(),
              _buildSettingButton(),
              _buildExitButton(),
              _buildClickableTowerItem(),
              _buildClickableCarouselItem(),
              _buildClickableTrainItem(),
              _buildClickableTentItem(),
              _buildCat(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCat() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Image(
        image: const AssetImage(
          'assets/images/Characters/cat.png',
        ),
        height: Get.width * .15,
        width: Get.width * .15,
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
          height: Get.height * .12,
          width: Get.height * .12,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/settingButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExitButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          controller.showExitAlert();
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 28.0,
            top: Get.height * .2,
          ),
          height: Get.height * .12,
          width: Get.height * .12,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/exitButton.png',
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
