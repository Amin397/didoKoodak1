import 'dart:ui';

import 'package:dido_koodak1/Model/IceCreamGame/ice_cream_material_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/IceCreamGame/ice_cream_game_controller.dart';
import '../../Utils/rout_utils.dart';
import '../../Utils/shakeAnimation.dart';

class IceCreamGameScreen extends StatelessWidget {
  IceCreamGameScreen({Key? key}) : super(key: key);

  final IceCreamGameController controller = Get.put(IceCreamGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildBlurFilter(),
            _buildDesk(),
            _buildButtons(),
            _buildHeart(),
            _buildIceCreamItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeart() {
    return Align(
      alignment: Alignment.topRight,
      child: CustomShakeWidget(
        duration: const Duration(milliseconds: 750),
        shakeCount: 4,
        shakeOffset: 4,
        key: controller.heart,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .02,
            vertical: Get.height * .08,
          ),
          width: Get.width * .2,
          height: Get.height * .1,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset('assets/images/heartBg.svg'),
              ),
              Center(
                child: Container(
                  padding: paddingSymmetricH12,
                  width: Get.width * .2,
                  height: Get.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildHeartItem(
                        heartNumber: 3,
                      ),
                      _buildHeartItem(
                        heartNumber: 2,
                      ),
                      _buildHeartItem(
                        heartNumber: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeartItem({required int heartNumber}) {
    return Obx(
      () => SvgPicture.asset(
        (controller.heartNumber.value >= heartNumber)
            ? 'assets/images/fullHeart.svg'
            : 'assets/images/emptyHeart.svg',
        height: 25.0,
        width: 25.0,
      ),
    );
  }

  Widget _buildBg() {
    return const Image(
      image: AssetImage(
        'assets/images/Backgrounds/iceCreamBg.PNG',
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      fit: BoxFit.fill,
    );
  }

  Widget _buildBlurFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.5,
        sigmaY: 3.5,
      ),
      child: SizedBox(
        height: Get.height,
        width: Get.width,
      ),
    );
  }

  Widget _buildDesk() {
    return SvgPicture.asset(
      'assets/images/Backgrounds/iceCreamDesk.svg',
      height: Get.height,
      width: Get.width,
      fit: BoxFit.fill,
    );
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: paddingAll32,
        height: Get.height * .15,
        width: Get.width * .18,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Image(
                  image: AssetImage(
                    'assets/images/Buttons/backButton.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(NameRouts.home);
                },
                child: const Image(
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

  Widget _buildIceCreamItems() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .4,
        ),
        height: Get.height * .4,
        width: Get.width,
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    _buildItems(
                      angle: -.3,
                      item: controller.iceCreamMaterial[8],
                      margin: EdgeInsets.only(
                        left: Get.width * .03,
                      ),
                    ),
                    _buildItems(
                      angle: -.3,
                      item: controller.iceCreamMaterial[7],
                      margin: EdgeInsets.only(
                        left: Get.width * .01,
                      ),
                    ),
                    _buildItems(
                      angle: -.3,
                      item: controller.iceCreamMaterial[9],
                      margin: EdgeInsets.only(
                        left: Get.width * .01,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildMainIceCream(),
            Flexible(
              flex: 8,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Row(
                  children: [
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[6],
                      margin: EdgeInsets.only(left: Get.width * .02),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[4],
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[3],
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[5],
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[2],
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial[1],
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                    _buildItems(
                      angle: .3,
                      item: controller.iceCreamMaterial.first,
                      margin: EdgeInsets.only(left: Get.width * .01),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItems({
    required double angle,
    required IceCreamMaterialModel item,
    required EdgeInsets margin,
  }) {
    return Transform.rotate(
      angle: angle,
      child: InkWell(
        onTap: () {
          controller.createOrder(
            item: item,
          );
        },
        child: Container(
          margin: margin,
          height: Get.height * .27,
          width: Get.width * .06,
        ),
      ),
    );
  }

  Widget _buildMainIceCream() {
    return Flexible(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 12.0,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: GetBuilder(
          init: controller,
          id: 'createOrder',
          builder: (ctx) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                if (controller.orderList.isNotEmpty)
                  _buildBread(
                    breadPath: controller.orderList.first.path,
                  ),
                if (controller.orderList.length >= 2)
                  _buildFirstCream(
                    firstCreamPath: controller.orderList[1].path,
                  ),
                if (controller.orderList.length >= 3)
                  _buildSecondCream(
                    secondCreamPath: controller.orderList[2].path,
                  ),
                if (controller.orderList.length >= 4)
                  _buildThirdCream(
                    thirdCreamPath: controller.orderList[3].path,
                  ),
                if (controller.orderList.length >= 5)
                  _buildMaterial(
                    materialPath: controller.orderList.last.path,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBread({
    required String breadPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .1,
        ),
        child: SvgPicture.asset(
          breadPath,
          height: Get.height * .18,
          width: Get.width * .03,
        ),
      ),
    );
  }

  Widget _buildFirstCream({
    required String firstCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .05,
          right: Get.width * .008,
        ),
        child: SvgPicture.asset(
          firstCreamPath,
          height: Get.height * .095,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildSecondCream({
    required String secondCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .13,
          right: Get.width * .008,
        ),
        child: SvgPicture.asset(
          secondCreamPath,
          height: Get.height * .095,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildThirdCream({
    required String thirdCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .18,
          right: Get.width * .008,
        ),
        child: SvgPicture.asset(
          thirdCreamPath,
          height: Get.height * .11,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildMaterial({required String materialPath}) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .28,
          right: Get.width * .008,
        ),
        child: SvgPicture.asset(
          materialPath,
          height: Get.height * .08,
          width: Get.width * .02,
        ),
      ),
    );
  }
}
