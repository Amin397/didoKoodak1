import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Const/measures.dart';
import '../../Controller/SingleHome/single_home_controller.dart';
import 'Widgets/bsuild_tower_widget.dart';
import 'Widgets/build_carouse_widget.dart';
import 'Widgets/build_tent_widget.dart';

class SingleHomeScreen extends StatelessWidget {
  SingleHomeScreen({Key? key}) : super(key: key);

  final SingleHomeController controller = Get.put(SingleHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (page) {
                  controller.changedPage(page: page);
                },
                children: [
                  BuildTowerWidget(
                    controller: controller,
                  ),
                  BuildCarouseWidget(
                    controller: controller,
                  ),
                  BuildTentWidget(
                    controller: controller,
                  ),
                ],
              ),
            ),
            _buildHomeButton(),
            _buildSettingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          // controller.goToSetting();
          controller.pageController.previousPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
        },
        child: Container(
          margin: paddingAll28,
          height: Get.height * .1,
          width: Get.height * .1,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/settingButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          // Get.back();
          controller.pageController.nextPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
        },
        child: Container(
          margin: paddingAll28,
          height: Get.height * .1,
          width: Get.height * .1,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/homeButton.png',
            ),
          ),
        ),
      ),
    );
  }
}
