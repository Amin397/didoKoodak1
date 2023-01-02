import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogicScreen extends StatelessWidget {
  LogicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image(
                image: AssetImage(
                  'assets/images/Backgrounds/splashBg.PNG',
                ),
                fit: BoxFit.fill,
              ),
            ),
            _buildBg(),
            _buildRadin(),
            // _buildBackButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        fit: BoxFit.fill,
        height: Get.height * .6,
        width: Get.height * .7,
      ),
    );
  }



  Widget _buildRadin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .7,
        ),
        height: Get.height * .45,
        width: Get.width * .25,
        child:const Image(
          image: AssetImage(
            'assets/images/Characters/radin.png',
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }


}
