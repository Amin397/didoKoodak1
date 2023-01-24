import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/Shop/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildShopCategoryWidget extends StatelessWidget {
  const BuildShopCategoryWidget({Key? key, required this.controller})
      : super(key: key);

  final ShopController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .05,
          vertical: Get.height * .1,
        ),
        height: Get.height * .45,
        width: Get.width * .75,
        child: Row(
          children: [
            _buildCategoryItem(
              text: 'اسباب بازی',
            ),
            _buildCategoryItem(
              text: 'لوازم التحریر',
            ),
            _buildCategoryItem(
              text: 'اکسسوری',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String text,
  }) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          controller.goToProductList(
            title: text,
          );
        },
        child: Container(
          margin: paddingAll10,
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0XFFFFE0AF),
            boxShadow: shadow(
              offset: const Offset(3.0, 3.0),
            ),
            borderRadius: radiusAll24,
          ),
          child: Center(
            child: AutoSizeText(
              text,
              maxLines: 1,
              maxFontSize: 28.0,
              minFontSize: 20.0,
              style: TextStyle(
                color: textRedColor,
                fontSize: 24.0,
                fontFamily: 'gohar',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
