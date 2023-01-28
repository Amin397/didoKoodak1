import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Const/measures.dart';
import '../../Controller/Basket/basket_controller.dart';
import '../../Utils/widget_util.dart';
import 'Widgets/build_basket_list_widget.dart';


class BasketScreen extends StatelessWidget {
  BasketScreen({Key? key}) : super(key: key);


  final BasketController controller = Get.put(BasketController());

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
              BuildBasketListWidget(
                controller: controller,
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
          image: const AssetImage(
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
          ],
        ),
      ),
    );
  }



}
