import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Model/FloreModel/flore_two_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SingleRoom/single_room_controller.dart';
import '../../Utils/rout_utils.dart';

class SingleRoomScreen extends StatelessWidget {
  SingleRoomScreen({Key? key}) : super(key: key);

  final SingleRoomController controller = Get.put(SingleRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildMainVideos(),
            _buildArrowLeft(),
            _buildArrowRight(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: paddingAll24,
        height: Get.height * .15,
        width: Get.width * .18,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Image(
                  image: AssetImage(
                    'assets/images/Buttons/backButton.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.offAndToNamed(NameRouts.home);
                },
                child: const Image(
                  image: AssetImage(
                    'assets/images/Buttons/homeButton.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.currentPage.value != controller.videosList.length -1)
              ? IconButton(
                  onPressed: () {
                    controller.pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 60.0,
                    color: Color(0xff9F5A59),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildArrowLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.currentPage.value != 0)
              ? IconButton(
                  onPressed: () {
                    controller.pageController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 60.0,
                    color: Color(0xff9F5A59),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Image(
      image: const AssetImage(
        'assets/images/Backgrounds/singleRoomBg.png',
      ),
      fit: BoxFit.fill,
      height: Get.height,
      width: Get.width,
    );
  }

  Widget _buildMainVideos() {
    return Center(
      child: SizedBox(
        height: Get.height * .6,
        width: Get.width * .8,
        child: PageView.builder(
          itemCount: controller.videosList.length,
          controller: controller.pageController,
          onPageChanged: (page) {
            controller.changePage(page: page);
          },
          itemBuilder: (BuildContext context, int index) {
            return _buildVideoItem(video: controller.videosList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildVideoItem({required VideoModel video}) {
    return InkWell(
      onTap: (){
        controller.goToVideo(videoPath:video.videoPath);
      },
      child: Container(
        height: double.maxFinite,
        width: Get.width * .2,
        decoration: BoxDecoration(
          color: const Color(0XFFA383B8),
          borderRadius: radiusAll12,
          boxShadow: shadow(),
        ),
        margin: paddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                margin: paddingAll12,
                decoration: BoxDecoration(
                  boxShadow: shadow(),
                ),
                child: ClipRRect(
                  borderRadius: radiusAll12,
                  child: Image(
                    image: AssetImage(
                      video.imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: Get.height * .15,
              child: Center(
                child: AutoSizeText(
                  video.title,
                  maxLines: 1,
                  maxFontSize: 20.0,
                  minFontSize: 12.0,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'gohar',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
