import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

const EdgeInsets paddingAll8 = EdgeInsets.all(8.0);
const EdgeInsets paddingAll4 = EdgeInsets.all(4.0);
const EdgeInsets paddingAll10 = EdgeInsets.all(10.0);
const EdgeInsets paddingAll6 = EdgeInsets.all(6.0);
const EdgeInsets paddingAll16 = EdgeInsets.all(16.0);
const EdgeInsets paddingAll12 = EdgeInsets.all(12.0);
const EdgeInsets paddingAll24 = EdgeInsets.all(24.0);
const EdgeInsets paddingAll28 = EdgeInsets.all(28.0);
const EdgeInsets paddingAll32 = EdgeInsets.all(32.0);
const EdgeInsets paddingSymmetricH8 = EdgeInsets.symmetric(horizontal: 8.0);
const EdgeInsets paddingSymmetricH4 = EdgeInsets.symmetric(horizontal: 4.0);
const EdgeInsets paddingSymmetricH16 = EdgeInsets.symmetric(horizontal: 16.0);
const EdgeInsets paddingSymmetricH12 = EdgeInsets.symmetric(horizontal: 12.0);
const EdgeInsets paddingSymmetricH24 = EdgeInsets.symmetric(horizontal: 24.0);
const EdgeInsets paddingSymmetricH30 = EdgeInsets.symmetric(horizontal: 24.0);
const EdgeInsets paddingSymmetricV8 = EdgeInsets.symmetric(vertical: 8.0);
const EdgeInsets paddingSymmetricV4 = EdgeInsets.symmetric(vertical: 4.0);
const EdgeInsets paddingSymmetricV2 = EdgeInsets.symmetric(vertical: 2.0);
const EdgeInsets paddingSymmetricV16 = EdgeInsets.symmetric(vertical: 16.0);
const EdgeInsets paddingSymmetricV24 = EdgeInsets.symmetric(vertical: 24.0);

final BorderRadius radiusAll6 = BorderRadius.circular(6.0);
final BorderRadius radiusAll8 = BorderRadius.circular(8.0);
final BorderRadius radiusAll10 = BorderRadius.circular(10.0);
final BorderRadius radiusAll12 = BorderRadius.circular(12.0);
final BorderRadius radiusAll16 = BorderRadius.circular(16.0);
final BorderRadius radiusAll24 = BorderRadius.circular(24.0);
final BorderRadius radiusAll28 = BorderRadius.circular(28.0);
final BorderRadius radiusAll32 = BorderRadius.circular(32.0);
final BorderRadius radiusAll36 = BorderRadius.circular(36.0);
final BorderRadius radiusAll20 = BorderRadius.circular(20.0);

const double moneyTextSize = 22.0;
const double titleTextSize = 18.0;
const double contentTextSize = 16.0;
const double mediumContentTextSize = 14.0;
const double smallContentTextSize = 10.0;

const appId = 'e1c71f23cce542b1b15b7b5063f29004';
const token =
    "007eJxTYHCZfnDfUoFN3cYNlb3TwmWdixdW3rOKaGNfk7F9oavnxlUKDKmGyeaGaUbGycmppiZGSYZJhqZJ5kmmBmbGaUaWBgYmjk+EkvebiiR3bglmZWRgZGABYhCfCUwyg0kWMMnNkJibmVeUn59rYmDAwAAAoUomRA==";

List<BoxShadow> shadow({
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: (Get.isDarkMode) ? Colors.black26 : Colors.grey.withOpacity(.3),
      blurRadius: 5.0,
      spreadRadius: 3.0,
      offset: offset,
    ),
  ];
}

void showError({
  String? errorMessage,
}) {
  Get.snackbar(
    'Error',
    errorMessage!,
    leftBarIndicatorColor: mainBgColor,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
// borderRadius: 10.0,
    backgroundColor: mainBgColor.withOpacity(.2),
    margin: EdgeInsets.only(
      bottom: Get.height * .15,
    ),
    padding: EdgeInsets.symmetric(
      vertical: Get.height * .03,
      horizontal: Get.width * .03,
    ),
    boxShadows: shadow(),
  );
}

void showSuccess({String? successMessage}) {
  Get.snackbar(
    'Success',
    successMessage!,
    leftBarIndicatorColor: mainDarkColor,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
// borderRadius: 10.0,
    boxShadows: shadow(),
    backgroundColor: Colors.green.shade800.withOpacity(.2),
    margin: EdgeInsets.only(
      bottom: Get.height * .15,
    ),
    padding: EdgeInsets.symmetric(
      vertical: Get.height * .03,
      horizontal: Get.width * .03,
    ),
  );
}
