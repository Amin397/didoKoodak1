import 'package:dido_koodak1/Controller/SelectAddress/select_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddNewAddressAlertWidget extends StatelessWidget {
  const AddNewAddressAlertWidget({Key? key , required this.controller}) : super(key: key);


  final SelectAddressController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.red,
    );
  }
}
