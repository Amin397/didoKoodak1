import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildSingleLoginWidget extends StatelessWidget {
  const BuildSingleLoginWidget({Key? key, required this.controller})
      : super(key: key);

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
                      'ایجاد کاربر جدید',
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
