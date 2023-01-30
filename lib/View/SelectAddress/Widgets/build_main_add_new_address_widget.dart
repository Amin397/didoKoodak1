import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/colors.dart';
import '../../../Const/measures.dart';
import '../../../Controller/SelectAddress/select_address_controller.dart';
import '../../../Utils/widget_util.dart';

class BuildMainAddNewAddressWidget extends StatelessWidget {
  const BuildMainAddNewAddressWidget({Key? key, required this.controller})
      : super(key: key);

  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: double.maxFinite,
      margin: paddingAll16,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: radiusAll32,
      ),
      padding: paddingAll16,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Text(
              'افزودن آدرس جدید',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'xKoodak',
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Container(
              height: Get.height * .4,
              width: Get.width * .55,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: radiusAll24,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'مرسوله شما به این موقعیت ارسال خواهد شد',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
                fontFamily: 'xKoodak',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              width: Get.width,
              height: Get.height * .2,
              margin: paddingSymmetricH30,
              decoration: BoxDecoration(
                borderRadius: radiusAll24,
                color: Colors.white,
                boxShadow: shadow(),
              ),
              child: WidgetUtil.textField(
                enable: true,
                controller: controller.fullAddressController,
                width: double.maxFinite,
                hint: 'آدرس کامل',
                padding: paddingSymmetricH12,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  color: textRedColor,
                  fontWeight: FontWeight.bold,
                ),
                height: Get.height * .07,
                bgColor: Colors.white54,
                radius: radiusAll36,
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Container(
              width: Get.width,
              height: Get.height * .15,
              margin: paddingSymmetricH30,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: radiusAll20,
                        boxShadow: shadow(),
                        color: Colors.white,
                      ),
                      child: WidgetUtil.textField(
                        enable: true,
                        controller: controller.getterNameController,
                        width: double.maxFinite,
                        hint: 'نام و نام خانوادگی',
                        padding: paddingSymmetricH12,
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          color: textRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                        height: Get.height * .07,
                        bgColor: Colors.white54,
                        radius: radiusAll36,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .05,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: radiusAll20,
                        boxShadow: shadow(),
                        color: Colors.white,
                      ),
                      child: WidgetUtil.textField(
                        enable: true,
                        controller: controller.getterMobileController,
                        width: double.maxFinite,
                        hint: 'شماره تماس',
                        padding: paddingSymmetricH12,
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          color: textRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                        height: Get.height * .07,
                        bgColor: Colors.white54,
                        radius: radiusAll36,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
