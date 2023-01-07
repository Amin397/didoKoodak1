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
                            SizedBox(
                              width: Get.width * .15,
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToAlphabetGame();
                              },
                              child: Transform.rotate(
                                angle: -.05,
                                child: SizedBox(
                                  height: Get.height * .4,
                                  width: Get.width * .18,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Transform.rotate(
                                            angle: .3,
                                            child: Text(
                                              ' A',
                                              style: TextStyle(
                                                fontSize: 86.0,
                                                color: Colors.red.shade900,
                                                fontFamily: 'xKoodak',
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Transform.rotate(
                                              angle: -.3,
                                              child: Text(
                                                ' B',
                                                style: TextStyle(
                                                  fontSize: 86.0,
                                                  color: Colors.red.shade900,
                                                  fontFamily: 'xKoodak',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
                                  controller.goToAnimalInfo();
                                },
                                child: SizedBox(
                                  height: Get.height * .4,
                                  width: Get.width * .18,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 18.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Transform.rotate(
                                            angle: .2,
                                            child: const Image(
                                              image: AssetImage(
                                                  'assets/images/owl.png'),
                                              height: 90.0,
                                              width: 70.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Transform.rotate(
                                              angle: -.2,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/tiger.png'),
                                                height: 90.0,
                                                width: 70.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .08,
                            ),
                            // SizedBox(
                            //   height: double.maxFinite,
                            //   width: double.maxFinite,
                            //   child: _buildBg(),
                            // ),
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
          height: Get.height * .12,
          width: Get.height * .12,
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
          height: Get.height * .12,
          width: Get.height * .12,
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
    return const Image(
      image: AssetImage(
        'assets/images/Backgrounds/gameListBg.png',
      ),
      fit: BoxFit.fill,
    );
  }
}
