import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../Const/measures.dart';
import '../../Controller/SelectAddress/select_address_controller.dart';
import '../../Utils/widget_util.dart';
import 'Widgets/build_select_address_main_widget.dart';


class SelectAddressScreen extends StatelessWidget {
  SelectAddressScreen({Key? key}) : super(key: key);


  final SelectAddressController controller = Get.put(SelectAddressController());

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
              BuildSelectAddressMainWidget(
                controller:controller,
              ),
              _buildCat(),
            ],
          ),
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


}
