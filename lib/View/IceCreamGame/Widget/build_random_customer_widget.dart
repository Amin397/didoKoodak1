import 'package:dido_koodak1/Model/IceCreamGame/ice_cream_customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import '../../../Controller/IceCreamGame/ice_cream_game_controller.dart';

class BuildRandomCustomerWidget extends StatelessWidget {
  const BuildRandomCustomerWidget({Key? key, required this.controller})
      : super(key: key);

  final IceCreamGameController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SizedBox(
          width: Get.width,
          height: Get.height * .6,
          child: GetBuilder(
            init: controller,
            id: 'createCustomer',
            builder: (ctx) {
              return AnimatedList(
                key: controller.keys,
                scrollDirection: Axis.horizontal,
                initialItemCount: controller.customerOrderedList.length,
                itemBuilder: (BuildContext context, int index, animation) {
                  return _buildCustomerItem(
                    item: controller.customerOrderedList[index],
                    index: index,
                    animation: animation,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerItem(
      {required IceCreamOrderModel item,
      required int index,
      required Animation<double> animation}) {
    return DragTarget(
      onWillAccept: (value) => true,
      onAccept: (value) {
        controller.checkIceCream(
          item: item,
          index: index,
          animation: animation,
        );
      },
      builder: (context, canditates, rejected) {
        return FadeTransition(
          opacity: animation,
          child: InkWell(
            onTap: () {
              controller.removeCustomer(
                index: index,
              );
            },
            child: Container(
              height: double.maxFinite,
              width: Get.width * .25,
              margin: paddingSymmetricH8,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIceCream(
                    item: item,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: SvgPicture.asset(
                        controller.customerOrderedList[index].customer.imgPath,
                        width: Get.width * .2,
                        height: Get.height * .5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIceCream({required IceCreamOrderModel item}) {
    return Container(
      width: Get.width * .09,
      height: Get.width * .12,
      decoration: BoxDecoration(
        boxShadow: shadow(),
        borderRadius: radiusAll16,
        color: Color(item.color).withOpacity(1).withAlpha(200),
      ),
      margin: EdgeInsets.only(
        bottom: Get.height * .26,
        right: 8.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildBread(
            breadPath: controller.iceCreamMaterial
                .singleWhere((element) => element.id == item.order.first)
                .path,
          ),
          _buildFirstCream(
            firstCreamPath: controller.iceCreamMaterial
                .singleWhere((element) => element.id == item.order[1])
                .path,
          ),
          _buildSecondCream(
            secondCreamPath: controller.iceCreamMaterial
                .singleWhere((element) => element.id == item.order[2])
                .path,
          ),
          _buildThirdCream(
            thirdCreamPath: controller.iceCreamMaterial
                .singleWhere((element) => element.id == item.order[3])
                .path,
          ),
          _buildMaterial(
            materialPath: controller.iceCreamMaterial
                .singleWhere((element) => element.id == item.order.last)
                .path,
          ),
        ],
      ),
    );
  }

  Widget _buildBread({
    required String breadPath,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .05,
          left: 8.0,
        ),
        child: SvgPicture.asset(
          breadPath,
          height: Get.height * .12,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildFirstCream({
    required String firstCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .04,
        ),
        child: SvgPicture.asset(
          firstCreamPath,
          height: Get.height * .07,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildSecondCream({
    required String secondCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .01,
        ),
        child: SvgPicture.asset(
          secondCreamPath,
          height: Get.height * .07,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildThirdCream({
    required String thirdCreamPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .06,
        ),
        child: SvgPicture.asset(
          thirdCreamPath,
          height: Get.height * .07,
          width: Get.width * .02,
        ),
      ),
    );
  }

  Widget _buildMaterial({
    required String materialPath,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: Get.height * .14,
        ),
        child: SvgPicture.asset(
          materialPath,
          height: Get.height * .04,
          width: Get.width * .02,
        ),
      ),
    );
  }
}
