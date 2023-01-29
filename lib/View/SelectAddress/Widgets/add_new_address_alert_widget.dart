import 'package:dido_koodak1/Controller/SelectAddress/select_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import 'build_main_add_new_address_widget.dart';


class AddNewAddressAlertWidget extends StatelessWidget {
  const AddNewAddressAlertWidget({Key? key , required this.controller}) : super(key: key);


  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: paddingAll16,
      child: Stack(
        children: [
          BuildMainAddNewAddressWidget(
            controller:controller,
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
}
