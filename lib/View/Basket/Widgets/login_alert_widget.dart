import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Controller/Basket/basket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import 'build_check_mobile_widget.dart';
import 'build_check_otp_widget.dart';

class LoginAlertWidget extends StatelessWidget {
  const LoginAlertWidget({Key? key, required this.controller})
      : super(key: key);

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .8,
      width: Get.width * .5,
      child: Stack(
        children: [
          _buildBg(),
          Obx(
            () => (controller.isOtpCodeSent.isTrue)
                ? BuildCheckOtpWidget(
                    controller: controller,
                  )
                : BuildCheckMobileWidget(
                    controller: controller,
                  ),
          ),
          _buildLoginButton(),
          _buildCloseButton(),
        ],
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        height: Get.height * .75,
        width: Get.width * .45,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          controller.loginAction();
        },
        child: SizedBox(
          height: Get.height * .15,
          width: Get.width * .2,
          child: Stack(
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/Buttons/loginButton.png',
                ),
                height: Get.height * .15,
                width: Get.width * .2,
              ),
              Obx(
                () => Center(
                  child: AutoSizeText(
                    (controller.isOtpCodeSent.isTrue) ? 'تایید' : 'ورود',
                    maxFontSize: 20.0,
                    minFontSize: 12.0,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Color(0XFF992C3E),
                      fontSize: 16.0,
                      fontFamily: 'gohar',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: radiusAll36,
        ),
        onTap: () {
          Get.back(result: false);
        },
        child: Image(
          image: const AssetImage(
            'assets/images/Buttons/closeButton.png',
          ),
          height: Get.width * .1,
          width: Get.width * .1,
        ),
      ),
    );
  }
}
