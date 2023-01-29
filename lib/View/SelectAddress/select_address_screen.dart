import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SelectAddress/select_address_controller.dart';


class SelectAddressScreen extends StatelessWidget {
  SelectAddressScreen({Key? key}) : super(key: key);


  final SelectAddressController controller = Get.put(SelectAddressController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
