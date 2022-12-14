import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtil {



  static Widget backButton({required Function function}) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Image(
        image:const AssetImage(
          'assets/images/Buttons/backButton.png',
        ),
        height: Get.height * .2,
        width: Get.height * .2,
      ),
    );
  }
}
