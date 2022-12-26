import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCarouseWidget extends StatelessWidget {
  const BuildCarouseWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleHomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _buildBg(),
          InkWell(
            onTap: (){
              controller.goToSinglePodcast();
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Get.width * .2,
                top: Get.height * .2
              ),
              height: Get.height * .55,
              width: Get.width * .4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Image(
        image: AssetImage(
          'assets/images/Backgrounds/carouseBg.PNG',
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
