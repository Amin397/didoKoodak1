import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SelectAddress/select_address_controller.dart';
import 'package:dido_koodak1/Model/Basket/send_date_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildSelectAddressMainWidget extends StatelessWidget {
  const BuildSelectAddressMainWidget({Key? key, required this.controller})
      : super(key: key);

  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .1,
          top: Get.height * .05,
        ),
        padding: paddingAll16,
        width: Get.width * .8,
        height: Get.height * .9,
        child: Column(
          children: [
            _buildAddressPart(),
            SizedBox(
              height: Get.height * .02,
            ),
            _buildSendTimePart(),
            SizedBox(
              height: Get.height * .02,
            ),
            _buildButtonPart(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressPart() {
    return Container(
      width: double.maxFinite,
      height: Get.height * .3,
      decoration: BoxDecoration(
        borderRadius: radiusAll24,
        color: const Color(0XFFFFE0AF),
        boxShadow: shadow(),
      ),
      padding: paddingAll12,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'آدرس تحویل سفارش',
              style: TextStyle(
                fontFamily: 'xKoodak',
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Container(
            width: double.maxFinite,
            height: Get.height * .1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radiusAll24,
            ),
            padding: paddingSymmetricH12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.edit,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'ویرایش',
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    controller.addNewAddress();
                  },
                  child: Row(
                    children: const [
                      Text(
                        'اضافه کردن آدرس جدید',
                        style: TextStyle(
                          fontFamily: 'xKoodak',
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.add,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Obx(
                () => Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    controller.addressList
                        .singleWhere((element) =>
                            element.value ==
                            controller.selectAddressGroupValue.value)
                        .fullAddress,
                    style: const TextStyle(
                      fontFamily: 'xKoodak',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSendTimePart() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: radiusAll24,
          color: const Color(0XFFFFE0AF),
          boxShadow: shadow(),
        ),
        padding: paddingAll12,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'انتخاب زمان ارسال',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'xKoodak',
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                width: double.maxFinite,
                height: Get.height * .08,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: controller.sendTimeList
                        .map((e) => _buildDayOfWeek(day: e))
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: Obx(
                  () => SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: controller.sendTimeList
                            .singleWhere((element) => element.isSelected.isTrue)
                            .timeOfDay
                            .map((e) => _buildRadioItem(
                                time: e,
                                groupValue: controller.sendTimeList
                                    .singleWhere(
                                        (element) => element.isSelected.isTrue)
                                    .groupSendTimeValue
                                    .value))
                            .toList(),
                      ),
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

  Widget _buildButtonPart() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: Get.width * .15,
        height: Get.height * .08,
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
    );
  }

  Widget _buildDayOfWeek({
    required SendDateModel day,
  }) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.selectDayForSend(
            day: day,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 370),
          height: double.maxFinite,
          width: Get.width * .15,
          margin: paddingSymmetricH8,
          decoration: BoxDecoration(
            color: (day.isSelected.isTrue)
                ? const Color(0XFF41B774)
                : Colors.transparent,
            border: Border.all(
              color: (day.isSelected.isTrue)
                  ? const Color(0XFF2F8986)
                  : Colors.transparent,
              width: (day.isSelected.isTrue) ? 2.0 : 0.0,
            ),
            borderRadius: radiusAll32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day.day,
                style: TextStyle(
                  color: (day.isSelected.isTrue) ? Colors.white : Colors.black,
                  fontSize: (day.isSelected.isTrue) ? 16.0 : 14.0,
                  fontFamily: 'xKoodak',
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                day.date,
                style: TextStyle(
                  color: (day.isSelected.isTrue)
                      ? Colors.white.withOpacity(.6)
                      : Colors.black.withOpacity(.6),
                  fontSize: 12.0,
                  fontFamily: 'xKoodak',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioItem({
    required TimeOfDayModel time,
    required int groupValue,
  }) {
    return Container(
      width: Get.width * .1,
      height: double.maxFinite,
      margin: paddingSymmetricH8,
      child: Column(
        children: [
          Radio(
            value: time.value,
            groupValue: groupValue,
            onChanged: (value) {
              controller.selectTime(
                value: value!,
              );
            },
          ),
          Text(
            time.title,
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'xKoodak',
            ),
          )
        ],
      ),
    );
  }
}
