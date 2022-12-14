import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import 'build_single_login_widget.dart';
import 'build_single_register_widget.dart';

class BuildLoginRegisterWidget extends StatelessWidget {
  const BuildLoginRegisterWidget({Key? key, required this.controller})
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
            _buildButtons(),
            _buildMain(),
          ],
        ),
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
        () => (controller.isLogin.isTrue)
            ? BuildSingleLoginWidget(
                controller: controller,
              )
            : BuildSingleRegisterWidget(
                controller: controller,
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
        width: Get.width * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleButton() {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: Get.height * .1,
        width: Get.width * .2,
        child: Stack(
          children: [
            Center(
              child: Image(
                image: const AssetImage(
                  'assets/images/Buttons/loginButton.png',
                ),
                height: Get.height * .1,
                width: Get.height * .2,
                fit: BoxFit.fill,
              ),
            ),
            Obx(
              () => Center(
                child: Text(
                  (controller.isLogin.isTrue) ? 'ورود' : 'ثبت نام',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: textRedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
