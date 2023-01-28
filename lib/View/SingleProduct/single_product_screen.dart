import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Const/colors.dart';
import '../../Const/measures.dart';
import '../../Controller/SingleProduct/single_product_controller.dart';
import 'Widgets/build_main_data_widget.dart';
import 'Widgets/build_product_image_widget.dart';

class SingleProductScreen extends StatelessWidget {
  SingleProductScreen({Key? key}) : super(key: key);

  final SingleProductController controller = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetUtil.bg(
        bgPath: 'assets/images/Backgrounds/shopBg.png',
        body: Stack(
          children: [
            _buildButtons(),
            BuildProductImageWidget(
              controller: controller,
            ),
            BuildMainDataWidget(
              controller: controller,
            ),
            _buildCat(),
          ],
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
}
