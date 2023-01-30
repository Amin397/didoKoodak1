import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/OrderDetails/order_details_controller.dart';
import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/colors.dart';
import '../../../Utils/widget_util.dart';

class BuildMainOrderDetailsWidget extends StatelessWidget {
  const BuildMainOrderDetailsWidget({Key? key, required this.controller})
      : super(key: key);

  final OrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .1,
        ),
        width: Get.width * .8,
        height: Get.height * .85,
        child: Stack(
          children: [
            _buildMainData(),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  controller.goToPayment();
                },
                child: Container(
                  width: Get.width * .18,
                  height: Get.height * .09,
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
                      'پرداخت ',
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainData() {
    return Center(
      child: Container(
        width: Get.width * .65,
        height: Get.height * .75,
        decoration: BoxDecoration(
          color: const Color(0XFFFFE0AF),
          borderRadius: radiusAll32,
          boxShadow: shadow(),
        ),
        padding: paddingAll24,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'جزئیات سفارش',
                style: TextStyle(
                  fontFamily: 'xKoodak',
                  fontSize: 16.0,
                ),
              ),
            ),
            _buildDayOfSent(),
            SizedBox(
              height: Get.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      moneyFormat(price: Blocs.basketBloc.sumPrice),
                      style: const TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width * .1,
                ),
                const Text(
                  'مجموع قیمت ',
                  style: TextStyle(
                    fontFamily: 'xKoodak',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      moneyFormat(price: controller.sendPrice),
                      style: const TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width * .1,
                ),
                const Text(
                  'هزینه ارسال ',
                  style: TextStyle(
                    fontFamily: 'xKoodak',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      moneyFormat(
                        price: Blocs.basketBloc.sumPrice + controller.sendPrice,
                      ),
                      style: const TextStyle(
                        fontFamily: 'xKoodak',
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width * .1,
                ),
                const Text(
                  'قابل پرداخت ',
                  style: TextStyle(
                    fontFamily: 'xKoodak',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadow(),
                  borderRadius: radiusAll24,
                ),
                child: WidgetUtil.textField(
                  enable: true,
                  controller: controller.descriptionsController,
                  width: double.maxFinite,
                  hint: 'توضیحات',
                  padding: paddingSymmetricH12,
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    color: textRedColor,
                    fontWeight: FontWeight.bold,
                  ),
                  inputType: TextInputType.text,
                  textAlign: TextAlign.right,
                  height: Get.height * .2,
                  bgColor: Colors.white54,
                  radius: radiusAll36,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDayOfSent() {
    return SizedBox(
      width: double.maxFinite,
      height: Get.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: Get.width * .1,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radiusAll20,
            ),
            margin: paddingSymmetricV4,
            child: Center(
              child: Text(
                '${Blocs.basketBloc.basketList.length} کالا',
                style: const TextStyle(
                  fontFamily: 'xKoodak',
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .1,
          ),
          Text(
            controller.sendTime.title,
            style: const TextStyle(
              fontFamily: 'xKoodak',
            ),
          ),
          SizedBox(
            width: Get.width * .1,
          ),
          Text(
            controller.dayOfWeek.date,
            style: const TextStyle(
              fontFamily: 'xKoodak',
            ),
          ),
          SizedBox(
            width: Get.width * .01,
          ),
          Text(
            controller.dayOfWeek.day,
            style: const TextStyle(
              fontFamily: 'xKoodak',
            ),
          ),
        ],
      ),
    );
  }
}

