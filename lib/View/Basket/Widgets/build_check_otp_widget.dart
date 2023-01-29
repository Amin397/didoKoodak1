import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Controller/Basket/basket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/colors.dart';
import '../../../Const/measures.dart';
import '../../../Utils/widget_util.dart';

class BuildCheckOtpWidget extends StatelessWidget {
  const BuildCheckOtpWidget({Key? key, required this.controller})
      : super(key: key);

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .07,
          vertical: Get.height * .17,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'ورود | ثبت نام',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'xKoodak',
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'کد تایید را وارد کنید',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'xKoodak',
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              WidgetUtil.textField(
                enable: true,
                controller: controller.otpCodeController,
                width: double.maxFinite,
                hint: 'کد تایید',
                padding: paddingSymmetricH12,
                textStyle: TextStyle(
                  fontSize: 16.0,
                  color: textRedColor,
                  fontWeight: FontWeight.bold,
                ),
                inputType: TextInputType.number,
                textAlign: TextAlign.right,
                height: Get.height * .07,
                bgColor: Colors.white54,
                radius: radiusAll36,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => Text(
                      '0:${controller.time.toString()}',
                      style:const TextStyle(
                        fontFamily: 'xKoodak',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const AutoSizeText(
                    'مانده تا دریافت مجدد کد :',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'xKoodak',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
