import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';

class ExitAlert extends StatelessWidget {
  const ExitAlert({Key? key}) : super(key: key);

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
          Center(
            child: SizedBox(
              width: Get.width * .4,
              height: Get.height * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCat(),
                  const Text(
                    'مطمئنی میخوای از دیدوپارک \n'
                    'خارج بشی؟',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'gohar',
                      fontSize: 16.0,
                      color: Color(0XFF992C3E),
                    ),
                  ),
                ],
              ),
            ),
          )
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
        onTap: () {
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
                  'خروج',
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
        height: Get.width * .12,
        width: Get.width * .12,
      ),
    );
  }
}
