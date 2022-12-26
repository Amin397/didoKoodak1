import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/GamesList/games_list_controller.dart';
import '../../Utils/rout_utils.dart';

class GamesListScreen extends StatelessWidget {
  GamesListScreen({Key? key}) : super(key: key);

  final GamesListController controller = Get.put(GamesListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: Get.height,
                width: Get.width * 1.63,
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: _buildBg(),
                    ),
                  ],
                ),
              ),
            ),
            _buildSettingButton(),
            _buildHomeButton(),


            // _buildBg(),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         controller.goToAlphabetGame();
            //       },
            //       child: const Text(
            //         'alphabet',
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         controller.goToAnimalInfo();
            //       },
            //       child: const Text(
            //         'animal info ',
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         controller.goToAnimalGame();
            //       },
            //       child: const Text(
            //         'animal Game',
            //       ),
            //     ),
            //   ],
            // ),
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
          // controller.pageController.previousPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
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
          Get.offAndToNamed(NameRouts.home);
          // controller.pageController.nextPage(duration: Duration(milliseconds: 1100), curve: Curves.easeInOutCubic);
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
    return Image(
      image: AssetImage(
        'assets/images/Backgrounds/gameListBg.png',
      ),
    );
  }
}
