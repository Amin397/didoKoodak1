import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/Basket/send_date_model.dart';

class OrderDetailsController extends GetxController{

  late TimeOfDayModel sendTime;
  late SendDateModel dayOfWeek;
  double sendPrice = 25000;

  TextEditingController descriptionsController = TextEditingController();


  @override
  void onInit() {
    sendTime = Get.arguments['sendTime'];
    dayOfWeek = Get.arguments['dayOfWeek'];


    super.onInit();
  }

  void goToPayment() {
    Blocs.basketBloc.cleanBasket();
    Get.offAllNamed(NameRouts.home);
  }
}