import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Const/measures.dart';
import '../../Controller/Shop/shop_controller.dart';
import 'Widgets/build_shop_category_widget.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);

  final ShopController controller = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: WidgetUtil.bg(
          bgPath: 'assets/images/Backgrounds/shopBg.png',
          body: Stack(
            children: [
              _buildButtons(),
              _buildSearchBox(),
              BuildShopCategoryWidget(
                controller:controller,
              ),
              _buildCat(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCat() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Image(
          image:const AssetImage(
            'assets/images/Characters/cat.png',
          ),
          height: Get.width * .2,
          width: Get.width * .2,
        ),
      ),
    );
  }


  Widget _buildButtons() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: paddingAll24,
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
                  // Get.offAllNamed(NameRouts.basket);
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

  Widget _buildSearchBox() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .25,
        ),
        height: Get.height * .15,
        width: Get.width * .8,
        decoration: const BoxDecoration(
          color: Color(0XFFF15A24),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(24.0),
          ),
        ),
        padding: EdgeInsets.only(
          right: Get.width * .05,
          left: Get.width * .02,
          top: Get.height * .02,
          bottom: Get.height * .02,
        ),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: paddingSymmetricH20,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.35),
            borderRadius: radiusAll24,
          ),
          child:const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'جست و جو',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'xKoodak',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
