import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/AlphabetInfo/alphabet_info_controller.dart';
import 'package:dido_koodak1/Controller/AlphabetInfo/alphabet_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../Globals/blocs.dart';
import 'Widgets/build_single_alphabet_item_widget.dart';

class AlphabetInfoScreen extends StatelessWidget {
  AlphabetInfoScreen({Key? key}) : super(key: key);

  final AlphabetInfoController controller = Get.put(AlphabetInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: PageView.builder(
                itemCount: controller.alphabetList.length,
                onPageChanged: (page){
                  controller.changePage(page:page);
                },
                itemBuilder: (BuildContext context, int index) =>
                    BuildSingleAlphabetItemWidget(
                  controller: controller,
                  letter: controller.alphabetList[index],
                ),
                controller: controller.pageController,
              ),
            ),
            _buildArrowLeft(),
            _buildArrowRight(),
            _buildBackButtonPart(),
          ],
        ),
      ),
    );
  }



  Widget _buildBackButtonPart() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .08,
          vertical: Get.height * .11,
        ),
        height: Get.height * .17,
        width: Get.width * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Get.back();
                Blocs.musicBloc.checkBgMusic();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    'assets/images/Buttons/backButton.png',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                controller.goToHome();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    'assets/images/Buttons/homeButton.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildArrowLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.currentPage.value != 0)
              ? IconButton(
                  onPressed: () {
                    controller.pageController.previousPage(duration:const Duration(seconds: 1), curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 60.0,
                    color: Color(0xff390000),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildArrowRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => (controller.currentPage.value != controller.alphabetList.length)
              ? IconButton(
                  onPressed: () {
                    controller.pageController.nextPage(duration:const Duration(seconds: 1), curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 60.0,
                    color: Color(0xff390000),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
