import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'build_single_info_widget.dart';
import 'build_single_setting_widget.dart';

class BuildSettingsMainWidget extends StatelessWidget {
  const BuildSettingsMainWidget({Key? key, required this.controller})
      : super(key: key);

  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height * .8,
        width: Get.height * .8,
        child: Stack(
          children: [
            _buildBg(),
            Obx(
              () => (controller.step.value == 0)
                  ? _buildButtons()
                  : const SizedBox(),
            ),
            _buildMain(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        fit: BoxFit.fill,
        height: Get.height * .6,
        width: Get.height * .7,
      ),
    );
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: paddingSymmetricV16,
        height: Get.height * .15,
        width: Get.width * .3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleButton(
              id: 2,
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            _buildSingleButton(
              id: 1,
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            _buildSingleButton(
              id: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleButton({
    required int id,
  }) {



    String buttonPath = '';


    switch(id){
      case 0 :{
        buttonPath = 'assets/images/Buttons/homeButton.png';
        break;
      }
      case 1:{
        buttonPath = 'assets/images/Buttons/infoButton.png';
        break;
      }
      default:{
        buttonPath = 'assets/images/Buttons/backButton.png';
        break;
      }
    }
    return InkWell(
      onTap: () {
        controller.buttonsAction(
          id: id,
        );
      },
      child: Image(
        image: AssetImage(
          buttonPath
        ),
        height: Get.height * .13,
        width: Get.height * .13,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildMain() {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 3),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Obx(
        () => (controller.semiStatus.value == 0)
            ? BuildSingleSettingWidget(
                controller: controller,
              )
            : BuildSingleInfoWidget(
                controller: controller,
              ),
      ),
    );
  }
}
