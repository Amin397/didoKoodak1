import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Model/AlphabetGame/alphabet_game_model.dart';
import 'package:dido_koodak1/Utils/shakeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/AlphabetGame/alphabet_game_controller.dart';
import '../../Utils/rout_utils.dart';

class AlphabetGameScreen extends StatelessWidget {
  AlphabetGameScreen({Key? key}) : super(key: key);

  final AlphabetGameController controller = Get.put(AlphabetGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildButtons(),
            _buildMainLetter(),
            _buildExamples(),
            _buildHeart(),
            _buildCat(),
          ],
        ),
      ),
    );
  }     


  Widget _buildCat() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .8,
        ),
        height: Get.height * .35,
        width: Get.width * .17,
        child: const Image(
          image: AssetImage(
            'assets/images/Characters/cat.png',
          ),
        ),
      ),
    );
  }




  Widget _buildButtons() {
    return Align(
      alignment: Alignment.topLeft,
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

  Widget _buildBg() {
    return Image(
      image: const AssetImage(
        'assets/images/Backgrounds/selectGameBg.png',
      ),
      height: Get.height,
      width: Get.width,
      fit: BoxFit.fill,
    );
  }

  Widget _buildMainLetter() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .08,
        ),
        height: Get.height * .55,
        width: Get.width * .35,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(3.0, 5.0),
            )
          ],
          color: const Color(0XFFFBB03B),
          borderRadius: radiusAll36,
        ),
        child: GetBuilder(
          init: controller,
          id: 'newQuestion',
          builder: (ctx) {
            return Center(
              child: AutoSizeText(
                '${controller.mainModel.upperLetter}${controller.mainModel.lowerLetter}',
                maxLines: 1,
                maxFontSize: 260.0,
                minFontSize: 180.0,
                style: const TextStyle(
                  color: Color(0XFFA30000),
                  fontSize: 220.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width * .6,
        height: Get.height * .35,
        child: GetBuilder(
          init: controller,
          id: 'newQuestion',
          builder: (ctx) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExamplesItem(
                  example: controller.mainModel.examples.first,
                ),
                _buildExamplesItem(
                  example: controller.mainModel.examples[1],
                ),
                _buildExamplesItem(
                  example: controller.mainModel.examples.last,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildExamplesItem({required AlphabetGameExamples example}) {
    return InkWell(
      onTap: () {
        controller.clickExample(
          example: example,
        );
      },
      child: Container(
        height: double.maxFinite,
        width: Get.width * .14,
        padding: paddingAll8,
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .03,
          vertical: Get.height * .02,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(3.0, 5.0),
            )
          ],
          color: const Color(0XFFFBB03B),
          borderRadius: radiusAll36,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                example.imagePath,
              ),
              height: Get.height * .2,
              width: Get.width * .13,
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Center(
                  child: AutoSizeText(
                    example.name,
                    maxLines: 1,
                    maxFontSize: 20.0,
                    minFontSize: 16.0,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0XFFA30000),
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

  Widget _buildHeart() {
    return Align(
      alignment: Alignment.topRight,
      child: CustomShakeWidget(
        duration:const Duration(milliseconds: 750),
        shakeCount: 4,
        shakeOffset: 4,
        key: controller.heart,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .04,
            vertical: Get.height * .1,
          ),
          width: Get.width * .2,
          height: Get.height * .1,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset('assets/images/heartBg.svg'),
              ),
              Center(
                child: Container(
                  padding: paddingSymmetricH12,
                  width: Get.width * .2,
                  height: Get.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildHeartItem(
                        heartNumber: 3,
                      ),
                      _buildHeartItem(
                        heartNumber: 2,
                      ),
                      _buildHeartItem(
                        heartNumber: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeartItem({required int heartNumber}) {
    return Obx(
      () => SvgPicture.asset(
        (controller.heartNumber.value >= heartNumber)
            ? 'assets/images/fullHeart.svg'
            : 'assets/images/emptyHeart.svg',
        height: 25.0,
        width: 25.0,
      ),
    );
  }
}
