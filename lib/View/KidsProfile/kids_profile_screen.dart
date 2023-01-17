import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Const/colors.dart';
import '../../Const/measures.dart';
import '../../Controller/KidsProfile/kids_profile_controller.dart';
import '../../Utils/widget_util.dart';
import 'Widgets/build_kids_profile_main_widget.dart';


class KidsProfileScreen extends StatelessWidget {
  KidsProfileScreen({Key? key}) : super(key: key);

  final KidsProfileController controller = Get.put(KidsProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: paddingAll32,
                child: WidgetUtil.backButton(function: () {
                  controller.backMethod();
                }),
              ),
            ),
            BuildKidsProfileMainWidget(controller: controller,),
            _buildShosho(),
            _buildSingleButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleButton() {
    return GestureDetector(
      onTap: () {
        controller.submitKidsProfile();
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Get.height * .1,
          width: Get.width * .2,
          margin: paddingSymmetricV24,
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: const AssetImage(
                    'assets/images/Buttons/loginButton.png',
                  ),
                  height: Get.height * .2,
                  width: Get.height * .25,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text(
                  'ثبت',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: textRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gohar'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildShosho() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .65,
        ),
        height: Get.height * .55,
        width: Get.width * .2,
        child: SvgPicture.asset('assets/images/Characters/shosho.svg'),
      ),
    );
  }
}
