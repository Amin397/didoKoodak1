import 'dart:math' as math;

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_formatter/money_formatter.dart';

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = math.sqrt(double.parse(twoDigits(duration.inHours)));
  final minutes = math.sqrt(double.parse(twoDigits(duration.inMinutes)));
  final seconds = math.sqrt(double.parse(twoDigits(duration.inSeconds)));

  return [
    if (duration.inHours > 0) {hours, minutes, seconds}
  ].join(':');
}


 String moneyFormat({required double price}) {
return MoneyFormatter(amount: price).output.withoutFractionDigits;
}
