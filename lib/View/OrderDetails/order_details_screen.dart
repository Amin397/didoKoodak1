import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../Const/measures.dart';
import '../../Controller/OrderDetails/order_details_controller.dart';
import '../../Utils/widget_util.dart';
import 'Widgets/build_main_order_details_widget.dart';



class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);


  final OrderDetailsController controller = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: WidgetUtil.bg(
          bgPath: 'assets/images/Backgrounds/shopBg.png',
          body: Stack(
            children: [
              _buildButtons(),
              BuildMainOrderDetailsWidget(
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
        margin: paddingAll12,
        height: Get.height * .15,
        width: Get.width * .1,
        child: Padding(
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
      ),
    );
  }


}
