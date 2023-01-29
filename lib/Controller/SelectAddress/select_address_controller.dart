import 'dart:ui';

import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Address/address_model.dart';
import '../../Model/Basket/send_date_model.dart';
import '../../View/SelectAddress/Widgets/add_new_address_alert_widget.dart';
import '../../View/SelectAddress/Widgets/select_address_alert_widget.dart';

class SelectAddressController extends GetxController {
  RxInt selectAddressGroupValue = 1.obs;
  List<SendDateModel> sendTimeList = [
    SendDateModel(
      day: 'شنبه',
      date: '1401/11/22',
      groupSendTimeValue: 0.obs,
      isSelected: true.obs,
      timeOfDay: [
        TimeOfDayModel(
          value: 1,
          title: 'شاعت 9 تا 12',
        ),
        TimeOfDayModel(
          value: 2,
          title: 'شاعت 12 تا 14',
        ),
        TimeOfDayModel(
          value: 3,
          title: 'شاعت 14 تا 18',
        ),
      ],
    ),
    SendDateModel(
      day: 'یکشنبه',
      date: '1401/11/23',
      groupSendTimeValue: 0.obs,
      isSelected: false.obs,
      timeOfDay: [
        TimeOfDayModel(
          value: 1,
          title: 'شاعت 9 تا 12',
        ),
        TimeOfDayModel(
          value: 2,
          title: 'شاعت 12 تا 14',
        ),
        TimeOfDayModel(
          value: 3,
          title: 'شاعت 14 تا 18',
        ),
      ],
    ),
    SendDateModel(
      day: 'دو شنبه',
      date: '1401/11/24',
      groupSendTimeValue: 0.obs,
      isSelected: false.obs,
      timeOfDay: [
        TimeOfDayModel(
          value: 1,
          title: 'شاعت 9 تا 12',
        ),
        TimeOfDayModel(
          value: 2,
          title: 'شاعت 12 تا 14',
        ),
        TimeOfDayModel(
          value: 3,
          title: 'شاعت 14 تا 18',
        ),
      ],
    ),
    SendDateModel(
      day: 'سه شنبه',
      date: '1401/11/25',
      groupSendTimeValue: 0.obs,
      isSelected: false.obs,
      timeOfDay: [
        TimeOfDayModel(
          value: 1,
          title: 'شاعت 9 تا 12',
        ),
        TimeOfDayModel(
          value: 2,
          title: 'شاعت 12 تا 14',
        ),
        TimeOfDayModel(
          value: 3,
          title: 'شاعت 14 تا 18',
        ),
      ],
    ),
  ];

  List<AddressModel> addressList = [
    AddressModel(
      fullAddress: 'کرج،45 متری گلشهر،ساختمان سیب،واحد 7',
      getterName: 'امین خادمی',
      getterPhone: '09383974483',
      value: 1,
    ),
    AddressModel(
      fullAddress: 'کرج،45 متری گلشهر،ساختمان سیب،واحد 8',
      getterName: 'امین خادمی',
      getterPhone: '09383974483',
      value: 2,
    ),
    AddressModel(
      fullAddress: 'کرج،45 متری گلشهر،ساختمان سیب،واحد97',
      getterName: 'امین خادمی',
      getterPhone: '09383974483',
      value: 3,
    ),
    AddressModel(
      fullAddress: 'کرج،45 متری گلشهر،ساختمان سیب،واحد 7',
      getterName: 'امین خادمی',
      getterPhone: '09383974483',
      value: 4,
    ),
    AddressModel(
      fullAddress: 'کرج،45 متری گلشهر،ساختمان سیب،واحد 7',
      getterName: 'امین خادمی',
      getterPhone: '09383974483',
      value: 5,
    ),
  ];

  void selectDayForSend({
    required SendDateModel day,
  }) {
    for (var o in sendTimeList) {
      o.isSelected(false);
      o.groupSendTimeValue(0);
    }
    day.isSelected(true);
  }

  void selectTime({required int value}) {
    sendTimeList
        .singleWhere((element) => element.isSelected.isTrue)
        .groupSendTimeValue(value);
  }

  void addNewAddress() async {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
              tileMode: TileMode.clamp,
            ),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              content: SelectAddressAlertWidget(
                controller: this,
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 370),
    );
  }

  void selectDefaultAddress({required int value}) {
    selectAddressGroupValue(value);
  }

  void goToAddNewAddress() async{
    Get.back();
    var addNewAddress = await showGeneralDialog(
      context: Get.context!,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
              tileMode: TileMode.clamp,
            ),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              content: AddNewAddressAlertWidget(
                controller: this,
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 370),
    );
  }
}
