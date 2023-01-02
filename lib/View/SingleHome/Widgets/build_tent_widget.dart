import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BuildTentWidget extends StatelessWidget {
  const BuildTentWidget({Key? key , required this.controller}) : super(key: key);

  final SingleHomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _buildBg(),
          _buildTrainClickPart(),

          buildShosho(),
          buildRadin(),
        ],
      ),
    );
  }

  Widget buildShosho() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .6,
        ),
        height: Get.height * .35,
        width: Get.width * .17,
        child: Image(
          image: AssetImage(
            'assets/images/Characters/shosho.png',
          ),
        ),
      ),
    );
  }


  Widget buildRadin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .8,
        ),
        height: Get.height * .3,
        width: Get.width * .2,
        child: Image(
          image: AssetImage(
            'assets/images/Characters/radinSit.png',
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }


  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Image(
        image: AssetImage(
          'assets/images/Backgrounds/tentBg.PNG',
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTrainClickPart() {
    return Positioned(
      bottom: Get.height * .1,
      left: Get.width * .05,
      child: InkWell(
        onTap: (){
          controller.goToGamesList();
        },
        child: SizedBox(
          width: Get.width * .4,
          height: Get.height * .3,
        ),
      ),
    );
  }

}
