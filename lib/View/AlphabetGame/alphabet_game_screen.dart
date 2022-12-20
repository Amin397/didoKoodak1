import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../Controller/AlphabetGame/alphabet_game_controller.dart';
import '../../Model/AlphabetGame/alphabet_model.dart';

class AlphabetGameScreen extends StatelessWidget {
  AlphabetGameScreen({Key? key}) : super(key: key);

  final AlphabetGameController controller = Get.put(AlphabetGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Obx(
            () => (controller.isLoaded.isTrue)
                ? _buildMainLetters()
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _buildMainLetters() {
    return GetBuilder(
      init: controller,
      id: 'letter',
      builder: (ctx) {
        return OnBoardingAnimation(
          pages: controller.alphabetList
              .map((e) => _buildLetterItemWidget(letter: e))
              .toList(),
          controller: controller.pageController,
        );
      },
    );
  }

  Widget _buildLetterItemWidget({
    required AlphabetModel letter,
  }) {
    return Container(
      height: Get.height,
      width: Get.height,
      margin: paddingAll24,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: radiusAll36,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            controller.nextPage();
          },
          child: Text(
            letter.letter.toString(),
          ),
        ),
      ),
    );
  }
}
