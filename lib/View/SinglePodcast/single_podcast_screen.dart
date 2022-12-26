import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/SinglePodcast/single_podcast_controller.dart';
import 'Widgets/build_podcast_part_widget.dart';

class SinglePodcastScreen extends StatelessWidget {
  SinglePodcastScreen({Key? key}) : super(key: key);

  final SinglePodcastController controller = Get.put(SinglePodcastController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            BuildPodcastPartWidget(
              controller:controller,
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
          controller.goToSetting();
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
          controller.goToHome();
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

  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Image(
        image: AssetImage(
          'assets/images/Backgrounds/singlePodcastBg.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
