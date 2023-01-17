import 'package:dido_koodak1/Controller/KidsProfile/kids_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/colors.dart';
import '../../../Const/measures.dart';
import '../../../Utils/widget_util.dart';

class BuildKidsProfileMainWidget extends StatelessWidget {
  const BuildKidsProfileMainWidget({Key? key, required this.controller})
      : super(key: key);

  final KidsProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height * .9,
        width: Get.height * .9,
        child: Stack(
          children: [
            _buildBg(),
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
        height: Get.height * .8,
        width: Get.height * .9,
      ),
    );
  }

  Widget _buildMain() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Get.height * .08,
          horizontal: Get.width * .05,
        ),
        height: Get.height * .7,
        width: Get.width * .4,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'مشخصات',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'gohar',
                  color: Color(0XFFC1272D),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            WidgetUtil.textField(
              enable: true,
              textAlign: TextAlign.right,
              controller: controller.kidsNameController,
              width: double.maxFinite,
              hint: 'نام کودک',
              padding: paddingSymmetricH12,
              textStyle: TextStyle(
                fontSize: 16.0,
                color: textRedColor,
                fontWeight: FontWeight.bold,
              ),
              height: Get.height * .12,
              bgColor: Colors.white54,
              radius: radiusAll36,
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            GetBuilder(
              init: controller,
              id: 'changeBirthDay',
              builder: (ctx) {
                return InkWell(
                  onTap: () {
                    controller.showDatePicker();
                  },
                  child: WidgetUtil.textField(
                    enable: false,
                    textAlign: TextAlign.right,
                    controller: controller.birthDayController,
                    width: double.maxFinite,
                    hint: 'تاریخ تولد',
                    padding: paddingSymmetricH12,
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      color: textRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                    height: Get.height * .12,
                    bgColor: Colors.white54,
                    radius: radiusAll36,
                    autoFocus: true,
                  ),
                );
              },
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            _buildGender(),
          ],
        ),
      ),
    );
  }

  Widget _buildGender() {
    return SizedBox(
      width: double.maxFinite,
      height: Get.height * .1,
      child: Row(
        children: [
          _buildGenderItem(
            value: 0,
            title: 'پسر',
          ),
          _buildGenderItem(
            value: 1,
            title: 'دختر',
          ),
        ],
      ),
    );
  }

  Widget _buildGenderItem({
    required int value,
    required String title,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'gohar',
                  color: Color(0XFFC1272D),
                ),
              ),
              Radio<int>(
                groupValue: controller.groupGenderValue.value,
                value: value,
                activeColor: const Color(0XFFC1272D),
                onChanged: (value) {
                  controller.changeGender(
                    value: value!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


}
