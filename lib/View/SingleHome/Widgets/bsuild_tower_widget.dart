import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

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
          _buildRadin(),
          _buildCat(),
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
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildClickablePart() {
    return Center(
      child: InkWell(
        onTap: () {
          controller.goToSingleTower();
        },
        child: SizedBox(
          width: Get.width * .7,
          height: Get.height * .9,
        ),
      ),
    );
  }

  Widget _buildRadin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .5,
        ),
        height: Get.height * .3,
        width: Get.width * .15,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: SvgPicture.asset('assets/images/Characters/radin.svg'),
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
        child: Image(
          image: AssetImage(
            'assets/images/Characters/cat.png',
          ),
        ),
      ),
    );
  }
}
