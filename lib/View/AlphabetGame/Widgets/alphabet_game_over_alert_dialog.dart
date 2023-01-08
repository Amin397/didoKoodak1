import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AlphabetGameOverAlertDialog extends StatelessWidget {
  const AlphabetGameOverAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .8,
      width: Get.width * .5,
      child: Stack(
        children: [
          _buildBg(),
          _buildReplayButton(),
          _buildCloseButton(),
          _buildCat(),
        ],
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        height: Get.height * .75,
        width: Get.width * .45,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildReplayButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: (){
          Get.back(result: true);
        },
        child: SizedBox(
          height: Get.height * .15,
          width: Get.width * .2,
          child: Stack(
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/Buttons/loginButton.png',
                ),
                height: Get.height * .15,
                width: Get.width * .2,
              ),
              const Center(
                child: AutoSizeText(
                  'دوباره',
                  maxFontSize: 20.0,
                  minFontSize: 12.0,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0XFF992C3E),
                    fontSize: 16.0,
                    fontFamily: 'gohar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: radiusAll36,
        ),
        onTap: () {
          Get.back(result: false);
        },
        child: Image(
          image: const AssetImage(
            'assets/images/Buttons/closeButton.png',
          ),
          height: Get.width * .1,
          width: Get.width * .1,
        ),
      ),
    );
  }

  Widget _buildCat() {
    return Center(
      child: SvgPicture.asset(
        'assets/images/Characters/sadCat.svg',
        height: Get.width * .2,
        width: Get.width * .2,
      ),
    );
  }

// Widget _buildCat() {
//   return
// }
}
