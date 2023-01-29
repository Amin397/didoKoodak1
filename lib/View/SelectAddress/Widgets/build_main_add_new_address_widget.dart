import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import '../../../Controller/SelectAddress/select_address_controller.dart';

class BuildMainAddNewAddressWidget extends StatelessWidget {
  const BuildMainAddNewAddressWidget({Key? key, required this.controller})
      : super(key: key);

  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: double.maxFinite,
      margin: paddingAll16,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: radiusAll24,
      ),
      padding: paddingAll16,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Text(
              'افزودن آدرس جدید',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'xKoodak',
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Container(
              height: Get.height * .4,
              width: Get.width * .55,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: radiusAll24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
