import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Setting/setting_controller.dart';
import 'Widgets/build_login_register_widget.dart';
import 'Widgets/build_settings_main_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image(
                image: AssetImage(
                  'assets/images/Backgrounds/splashBg.PNG',
                ),
                fit: BoxFit.fill,
              ),
            ),
            Obx(
              () => (controller.step.value != 0)
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: paddingAll32,
                        child: WidgetUtil.backButton(function: () {
                          controller.backMethod();
                        }),
                      ),
                    )
                  : const SizedBox(),
            ),
            Obx(
              () => (controller.status.value == 0)
                  ? BuildSettingsMainWidget(
                      controller: controller,
                    )
                  : BuildLoginRegisterWidget(
                      controller: controller,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
