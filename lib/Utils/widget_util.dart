import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Const/colors.dart';

class WidgetUtil {
  static Widget backButton({required Function function}) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Image(
        image: const AssetImage(
          'assets/images/Buttons/backButton.png',
        ),
        height: Get.height * .13,
        width: Get.height * .13,
      ),
    );
  }

  static Widget textField({
    required double width,
    required double height,
    required String hint,
    required Color bgColor,
    Widget suffix = const SizedBox(),
    Widget prefix = const SizedBox(),
    bool enable = true,
    required TextEditingController controller,
    required TextStyle textStyle,
    EdgeInsets margin = EdgeInsets.zero,
    EdgeInsets padding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.right,
    TextInputType inputType = TextInputType.text,
    bool autoFocus = false,
    bool obscureText = false,
    required BorderRadius radius,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        style: textStyle,
        enabled: enable,
        textAlign: textAlign,
        keyboardType: inputType,
        autofocus: autoFocus,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.0,
            color:textRedColor.withOpacity(.5),
            fontFamily: 'xKoodak',
          ),
          enabled: enable,
          suffix: suffix,
          prefix: prefix,
        ),
      ),
    );
  }





  static Widget bg({required String bgPath , required Widget body}){
    return Stack(
      children: [
        SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Image(
            image: AssetImage(
              bgPath,
            ),
            fit: BoxFit.fill,
          ),
        ),
        body,
      ],
    );
  }
}
