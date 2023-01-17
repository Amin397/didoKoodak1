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
              controller: controller.scrollController,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: Get.height * .1,
                          right: Get.width * .2,
                        ),
                        height: Get.height * .5,
                        width: Get.width * 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Transform.rotate(
                            //   angle: -.07,
                            //   child: InkWell(
                            //     onTap: () {
                            //       controller.goToAnimalGame();
                            //     },
                            //     child: Container(
                            //       height: Get.height * .45,
                            //       width: Get.width * .18,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: Get.width * .05,
                            // ),
                            InkWell(
                              onTap: () {
                                controller.goToAnimalInfo();
                              },
                              child: Transform.rotate(
                                angle: -.05,
                                child: SizedBox(
                                  height: Get.height * .4,
                                  width: Get.width * .18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .045,
                            ),
                            Transform.rotate(
                              angle: .07,
                              child: InkWell(
                                onTap: () {
                                  controller.goToAlphabetGame();
                                },
                                child: SizedBox(
                                  height: Get.height * .4,
                                  width: Get.width * .18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .08,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildSettingButton(),
            _buildHomeButton(),
            _buildBackButton(),
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
          Get.offAndToNamed(NameRouts.home);
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
      alignment: Alignment.topRight,
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

  Widget _buildBg() {
    return const Image(
      image: AssetImage(
        'assets/images/Backgrounds/gameListBg.png',
      ),
      fit: BoxFit.fill,
    );
  }
}
