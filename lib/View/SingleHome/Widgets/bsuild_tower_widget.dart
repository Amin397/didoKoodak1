import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildTowerWidget extends StatelessWidget {
  const BuildTowerWidget({Key? key, required this.controller})
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
          _buildClickablePart(),
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
          'assets/images/Backgrounds/towerBg.png',
        ),
      ),
    );
  }

  Widget _buildClickablePart() {
    return Center(
      child: InkWell(
        onTap: (){
          controller.goToSingleTower();
        },
        child: SizedBox(
          width: Get.width * .7,
          height: Get.height * .9,
        ),
      ),
    );
  }
}