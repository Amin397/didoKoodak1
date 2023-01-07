import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SelectAlphabetGame/select_alphabet_game_controller.dart';
import '../../Utils/rout_utils.dart';

class SelectAlphabetGameScreen extends StatelessWidget {
  SelectAlphabetGameScreen({Key? key}) : super(key: key);

  final SelectAlphabetGameController controller =
      Get.put(SelectAlphabetGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildGamesButton(),
            _buildCat(),
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

  Widget _buildGamesButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: Get.height * .5,
        width: Get.width * .5,
        child: Row(
          children: [
            _buildItemButton(
              imagePath: 'assets/images/blackBoard.png',
              id: 0,
            ),
            SizedBox(
              width: Get.width * .01,
            ),
            _buildItemButton(
              imagePath: 'assets/images/alphabet.png',
              id: 1,
            ),
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
          left: Get.width * .65,
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

  Widget _buildItemButton({
    required String imagePath,
    required int id,
  }) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          controller.goToSingleItem(
            id: id,
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .02,
            vertical: Get.height * .05,
          ),
          height: double.maxFinite,
          width: double.maxFinite,
          padding: paddingAll12,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 3.0,
                spreadRadius: 3.0,
                offset: Offset(3.0, 5.0),
              )
            ],
            color: const Color(0XFFFBB03B),
            borderRadius: radiusAll36,
          ),
          child: Center(
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
