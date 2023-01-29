import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../Controller/Basket/basket_controller.dart';
import 'build_basket_List_item_widget.dart';

class BuildBasketListWidget extends StatelessWidget {
  const BuildBasketListWidget({Key? key, required this.controller})
      : super(key: key);

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .12,
        ),
        height: Get.height * .85,
        width: Get.width * .8,
        child: Column(
          children: [
            BuildBasketListItemWidget(
              controller: controller,
            ),
            _buildBasketResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasketResult() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.maxFinite,
        height: Get.height * .1,
        padding: paddingSymmetricH12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'جمع سبد خرید :',
              style: TextStyle(
                fontFamily: 'xKoodak',
              ),
            ),
            Row(
              children: [
                StreamBuilder(
                  stream: Blocs.basketBloc.getStream,
                  builder: (c, m) {
                    return Text(
                      moneyFormat(price: Blocs.basketBloc.sumPrice),
                    );
                  },
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'تومان',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: (){
                controller.showLoginAlert();
              },
              child: Container(
                width: Get.width * .15,
                height: double.maxFinite,
                margin: paddingSymmetricV4,
                decoration: BoxDecoration(
                  color: const Color(0XFF41B774),
                  border: Border.all(
                    color: const Color(0XFF2F8986),
                    width: 2.0,
                  ),
                  borderRadius: radiusAll32,
                ),
                child: const Center(
                  child: Text(
                    'ادامه ',
                    style: TextStyle(
                      fontFamily: 'xKoodak',
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
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
