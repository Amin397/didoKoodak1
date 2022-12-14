import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/colors.dart';
import '../../../Const/measures.dart';


class BuildSingleRegisterWidget extends StatelessWidget {
  const BuildSingleRegisterWidget({Key? key , required this.controller}) : super(key: key);


  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll18,
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .05,
          vertical: Get.height * .15,
        ),
        child: Column(
          children: [
            WidgetUtil.textField(
              enable: true,
              controller: controller.userNameController,
              width: double.maxFinite,
              hint: 'نام کاربری',
              padding: paddingSymmetricH12,
              textStyle: TextStyle(
                fontSize: 22.0,
                color: textRedColor,
                fontWeight: FontWeight.bold,
              ),
              height: Get.height * .07,
              bgColor: Colors.white54,
              radius: radiusAll36,
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            WidgetUtil.textField(
              enable: true,
              controller: controller.phoneNumberController,
              width: double.maxFinite,
              hint: 'شماره تماس',
              padding: paddingSymmetricH12,
              textStyle: TextStyle(
                fontSize: 22.0,
                color: textRedColor,
                fontWeight: FontWeight.bold,
              ),
              inputType: TextInputType.number,
              textAlign: TextAlign.left,
              height: Get.height * .07,
              bgColor: Colors.white54,
              radius: radiusAll36,
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            WidgetUtil.textField(
              enable: true,
              obscureText: true,
              controller: controller.passwordController,
              width: double.maxFinite,
              hint: 'رمز عبور',
              padding: paddingSymmetricH12,
              textStyle: TextStyle(
                fontSize: 22.0,
                color: textRedColor,
                fontWeight: FontWeight.bold,
              ),
              height: Get.height * .07,
              bgColor: Colors.white54,
              radius: radiusAll36,
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            WidgetUtil.textField(
              enable: true,
              obscureText: true,
              controller: controller.rePasswordController,
              width: double.maxFinite,
              hint: 'تکرار رمز عبور',
              padding: paddingSymmetricH12,
              textStyle: TextStyle(
                fontSize: 22.0,
                color: textRedColor,
                fontWeight: FontWeight.bold,
              ),
              height: Get.height * .07,
              bgColor: Colors.white54,
              radius: radiusAll36,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      controller.switchToRegister();
                    },
                    child: const Text(
                      'حساب کاربری دارم',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
