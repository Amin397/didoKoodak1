import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCarouseWidget extends StatelessWidget {
  const BuildCarouseWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            // _buildBg2(),
            InkWell(
              onTap: () {
                controller.goToSinglePodcast();
              },
              child: Container(
                margin:
                    EdgeInsets.only(left: Get.width * .15, top: Get.height * .1),
                height: Get.height * .65,
                width: Get.width * .3,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.goToIceCreamGame();
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: Get.width * .08,
                    top: Get.height * .3,
                  ),
                  height: Get.height * .4,
                  width: Get.width * .15,
                  color: Colors.transparent,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.goToShop();
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    right: Get.width * .08,
                    top: Get.height * .3,
                  ),
                  height: Get.height * .5,
                  width: Get.width * .2,
                  color: Colors.transparent,
                ),
              ),
            ),
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
        height: Get.height * .3,
        width: Get.width * .15,
        child: const Image(
          image: AssetImage(
            'assets/images/Characters/cat.png',
          ),
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: const Image(
          image: AssetImage(
            'assets/images/Backgrounds/testBg2.PNG',
          ),
        ),
      ),
    );
  }
}
