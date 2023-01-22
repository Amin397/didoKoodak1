import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:dido_koodak1/Utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../Model/User/user_model.dart';

class KidsProfileController extends GetxController {
  Jalali? picker;
  TextEditingController kidsNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();

  RxInt groupGenderValue = 3.obs;

  late UserModel userModel;

  void backMethod() {
    Get.back();
  }

  @override
  void onInit() {
    userModel = Get.arguments['data'];

    print(userModel.mobile);
    super.onInit();
  }

  void showDatePicker() async {
    //
    showPersianDatePicker(
      context: Get.context!,
      initialDate: Jalali(1392, 1),
      firstDate: Jalali(1392, 1),
      lastDate: Jalali(1402, 12),
      builder: (BuildContext context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color(0XFFFFCE55),
              onPrimary: Colors.grey.shade800,
              onSurface: const Color(0XFFC1272D),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0XFFC1272D), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      birthDayController.text = value!.formatFullDate().toString();
      update(['changeBirthDay']);
    });
  }

  @override
  void dispose() {
    kidsNameController.dispose();
    birthDayController.dispose();
    super.dispose();
  }

  void changeGender({required int value}) {
    groupGenderValue(value);
  }

  void submitKidsProfile() async {
    userModel.kidProfile = KidProfile(
      kidName: kidsNameController.text.trim(),
      birthDay: birthDayController.text,
      gender: groupGenderValue.value,
    );

    await StorageUtils.setUserModel(userModel: userModel.toJson());
    Blocs.userBloc.setUserData(
      userModel: userModel,
    );

    Get.offAndToNamed(
      NameRouts.parentPanel,
    );
  }
}
