import 'dart:async';

import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:dido_koodak1/View/Basket/Widgets/login_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Globals/blocs.dart';
import '../../Model/Shop/product_model.dart';

class BasketController extends GetxController {
  RxBool isOtpCodeSent = false.obs;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  RxInt time = 60.obs;
  Timer? otpTimer;

  void addProduct({required ProductModel product}) {
    Blocs.basketBloc.addProductToBasket(
      product: product,
    );
  }

  void removeProduct({required ProductModel product}) {
    Blocs.basketBloc.removeProductFromBasket(
      product: product,
    );
  }

  void showLoginAlert() async {
    phoneNumberController = TextEditingController();
    otpCodeController = TextEditingController();
    var acceptLogin = await showGeneralDialog(
      context: Get.context!,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: LoginAlertWidget(
              controller: this,
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 370),
    );
    
    
    if(acceptLogin is bool && acceptLogin){
      Get.toNamed(NameRouts.selectAddress);
    }
  }

  void loginAction() async{
    if(isOtpCodeSent.isFalse){
      Get.back(result: true);
    }else{
      if(phoneNumberController.text.isNotEmpty){
        isOtpCodeSent(true);

        otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if(time >= 0){
            time.value -- ;
          }else{
            timer.cancel();
            isOtpCodeSent(false);
            time(60);
          }

        });
      }
    }
    
  }
}
