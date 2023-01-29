import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SelectAddress/select_address_controller.dart';
import 'package:dido_koodak1/Model/Address/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAddressAlertWidget extends StatelessWidget {
  const SelectAddressAlertWidget({Key? key, required this.controller})
      : super(key: key);

  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: paddingAll16,
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            margin: paddingAll32,
            child: Column(
              children: [
                InkWell(

                  child: Container(
                    height: Get.height * .2,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: radiusAll24,
                    ),
                    padding: paddingSymmetricH24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'افزودن آدرس جدید',
                                style: TextStyle(
                                  fontFamily: 'xKoodak',
                                ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Icon(Icons.location_on)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    controller.goToAddNewAddress();
                  },
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: radiusAll24,
                    ),
                    padding: paddingAll16,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.addressList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildAddressItem(
                          address: controller.addressList[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: radiusAll36,
              ),
              onTap: () {
                Get.back(result: false);
              },
              child: const Image(
                image: AssetImage(
                  'assets/images/Buttons/closeButton.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem({
    required AddressModel address,
  }) {
    return Container(
      width: double.maxFinite,
      height: Get.height * .1,
      margin: paddingSymmetricV4,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Row(
                children: [
                  Text(
                    address.getterName,
                    style: const TextStyle(
                      fontFamily: 'xKoodak',
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    address.fullAddress,
                    style: const TextStyle(
                      fontFamily: 'xKoodak',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .01,
          ),
          Obx(
            () => Radio(
              value: address.value,
              groupValue: controller.selectAddressGroupValue.value,
              onChanged: (value) {
                controller.selectDefaultAddress(
                  value: value as int,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
