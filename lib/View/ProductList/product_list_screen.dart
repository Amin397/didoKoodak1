import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/colors.dart';
import '../../Const/measures.dart';
import '../../Controller/ProductList/product_list_controller.dart';
import '../../Utils/widget_util.dart';
import 'Widgets/build_product_list_widget.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);

  final ProductListController controller = Get.put(ProductListController());

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
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Get.width * .08,
                    top: Get.height * .15,
                  ),
                  child: Text(
                    controller.categoryText,
                    style: TextStyle(
                      color: textRedColor,
                      fontSize: 20.0,
                      fontFamily: 'gohar',
                    ),
                  ),
                ),
              ),
              BuildProductListWidget(
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
