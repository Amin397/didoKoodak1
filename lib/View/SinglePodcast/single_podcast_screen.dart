import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/colors.dart';
import '../../Const/measures.dart';
import '../../Controller/SinglePodcast/single_podcast_controller.dart';
import 'Widgets/build_podcast_item_widget.dart';
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
            _buildPageView(),
            _buildHomeButton(),
            _buildSettingButton(),
            _buildBackButton(),
            _buildPageViewButtons(),
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
          height: Get.height * .14,
          width: Get.height * .14,
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
          height: Get.height * .14,
          width: Get.height * .14,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/homeButton.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 28.0,
            vertical: Get.height * .22,
          ),
          height: Get.height * .14,
          width: Get.height * .14,
          child: const Image(
            image: AssetImage(
              'assets/images/Buttons/backButton.png',
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildPageViewButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: Get.height * .1,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                controller.changePage(
                  next: false,
                );
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: textRedColor,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.changePage(
                  next: true,
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: textRedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.podcastsList.length,
        controller: controller.pageController,
        onPageChanged: (page) {
          controller.currentPage(page);
          for (var o in controller.podcastsList) {
            o.player.pause();
          }
          // controller.listener(podcast: controller.podcastsList[page]);
        },
        itemBuilder: (BuildContext context, int index) {
          return BuildPodcastItemWidget(
            controller: controller,
            podcast: controller.podcastsList[index],
          );
        },
      ),
    );
  }
}
