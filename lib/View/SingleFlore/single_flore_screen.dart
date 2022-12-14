import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Model/FloreModel/flore_two_model.dart';
import 'package:dido_koodak1/Model/FloreModel/room_model.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Controller/SingleFlore/single_flore_controller.dart';

class SingleFloreScreen extends StatelessWidget {
  SingleFloreScreen({Key? key}) : super(key: key);

  final SingleFloreController controller = Get.put(SingleFloreController());

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
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (page) {
                  controller.changePage(page: page);
                },
                itemCount: controller.listLength,
                itemBuilder: (BuildContext context, int index) {
                  if (controller.flore == 0) {
                    return _buildRoomItem(
                      room: controller.roomList[index],
                    );
                  } else {
                    return _buildRoomItem2(
                      room: controller.floreTwoModel[index],
                    );
                  }
                },
              ),
            ),
            _buildArrowLeft(),
            _buildArrowRight(),
            _buildButtons(),
            buildSitCat(),
          ],
        ),
      ),
    );
  }

  Widget buildSitCat() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .8,
        ),
        height: Get.height * .35,
        width: Get.width * .17,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Image(
            image: AssetImage(
              'assets/images/Characters/cat.png',
            ),
          ),
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
          () => (controller.currentPage.value != controller.listLength - 1)
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
    String bgPath;

    switch (controller.flore) {
      case 0:
        {
          bgPath = 'assets/images/Backgrounds/singleFloreOneBg.png';
          break;
        }
      case 1:
        {
          bgPath = 'assets/images/Backgrounds/singleFloreTwoBg.png';
          break;
        }
      default:
        {
          bgPath = 'assets/images/Backgrounds/singleFloreTwoBg.png';
          break;
        }
    }
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Image(
        image: AssetImage(
          bgPath,
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildRoomItem({required RoomModel room}) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _buildBg(),
          _buildTitle(
            title: room.title,
          ),
          _buildDoor(
            room: room,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({required String title}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .17,
          top: Get.height * .08,
        ),
        width: Get.width * .38,
        height: Get.height * .3,
        child: Center(
          child: AutoSizeText(
            title,
            maxLines: 1,
            maxFontSize: 34.0,
            minFontSize: 26.0,
            style: const TextStyle(
              fontFamily: 'gohar',
              fontSize: 30.0,
              color: Color(0xFFAC3F44),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoor({required RoomModel room}) {
    return Center(
      child: InkWell(
        onTap: () {
          controller.doorClick(
            room: room,
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            right: Get.width * .4,
          ),
          width: Get.width * .2,
          height: Get.height * .65,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: paddingAll32,
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
                  Get.offAllNamed(NameRouts.home);
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

  Widget _buildRoomItem2({required FloreTwoModel room}) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _buildBg(),
          _buildTitleImage(
            title: room.imagePath,
          ),
          _buildDoor2(
            room: room,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleImage({required String title}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .17,
          top: Get.height * .08,
        ),
        width: Get.width * .38,
        height: Get.height * .5,
        child: Image(
          image: AssetImage(
            title,
          ),
        ),
      ),
    );
  }

  Widget _buildDoor2({required FloreTwoModel room}) {
    return Center(
      child: InkWell(
        onTap: () {
          controller.doorClick2(
            room: room,
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            right: Get.width * .4,
          ),
          width: Get.width * .2,
          height: Get.height * .65,
        ),
      ),
    );
  }
}
