import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Const/colors.dart';
import '../../Const/measures.dart';
import '../../Controller/SingleProduct/single_product_controller.dart';
import '../../Globals/blocs.dart';
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
            StreamBuilder(
              stream: Blocs.basketBloc.getStream,
              builder: (c,x){
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          controller.goToBasket();
                          // Get.offAllNamed(NameRouts.basket);
                        },
                        child: const Image(
                          image: AssetImage(
                            'assets/images/Buttons/homeButton.png',
                          ),
                        ),
                      ),
                    ),
                    if (Blocs.basketBloc.basketList.isNotEmpty)
                      Positioned(
                        top: -4.0,
                        right: -4.0,
                        child: Container(
                          height: Get.height * .07,
                          width: Get.height * .07,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            boxShadow: shadow(),
                          ),
                          child: Center(
                            child: AutoSizeText(
                              Blocs.basketBloc.sumCount.toString(),
                              maxLines: 1,
                              maxFontSize: 14.0,
                              minFontSize: 10.0,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontFamily: 'xKoodak'
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
