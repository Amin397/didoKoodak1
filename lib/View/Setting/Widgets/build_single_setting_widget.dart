import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:dido_koodak1/Model/Setting/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildSingleSettingWidget extends StatelessWidget {
  const BuildSingleSettingWidget({Key? key, required this.controller})
      : super(key: key);

  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * .05,
        vertical: Get.height * .15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSwitcher(
            setting: controller.settingList[0],
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          _buildSwitcher(
            setting: controller.settingList[1],
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          _buildSwitcher(
            setting: controller.settingList[2],
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          _buildPanelButton()
        ],
      ),
    );
  }

  Widget _buildSwitcher({
    required SettingModel setting,
  }) {
    return InkWell(
      onTap: (){
        controller.switchToggle(
          setting: setting,
        );
      },
      child: Container(
        width: double.maxFinite,
        height: Get.height * .08,
        padding: paddingSymmetricH12,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: radiusAll24,
        ),
        child: Row(
          children: [
            _buildCreateSwitcher(
              setting: setting,
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    setting.title,
                    maxFontSize: 18.0,
                    minFontSize: 14.0,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16.0,
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

  Widget _buildCreateSwitcher({
    required SettingModel setting,
  }) {
    return Flexible(
      flex: 2,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: paddingSymmetricH16,
                height: double.maxFinite,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Obx(
                      () => Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: double.maxFinite,
                          // margin: paddingSymmetricH20,
                          height: Get.height * .03,
                          decoration: BoxDecoration(
                            color: (setting.isSwitched.isTrue)
                                ? switcherColor
                                : switcherColor.withOpacity(.5),
                            borderRadius: radiusAll36,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => AnimatedAlign(
                        duration: const Duration(milliseconds: 100),
                        alignment: (setting.isSwitched.isTrue)
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          height: Get.height * .05,
                          width: Get.height * .05,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: switcherToggleColor,
                            boxShadow: shadow(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanelButton() {
    return InkWell(
      onTap: (){
        controller.goToLoginRegister();
      },
      child: Container(
        width: double.maxFinite,
        height: Get.height * .09,
        padding: paddingSymmetricH12,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: radiusAll24,
        ),
        child: const Center(
          child: AutoSizeText(
            'پنل والدین',
            maxFontSize: 20.0,
            minFontSize: 16.0,
            maxLines: 1,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
