import 'package:dido_koodak1/Controller/Setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BuildSingleInfoWidget extends StatelessWidget {
  const BuildSingleInfoWidget({Key? key , required this.controller}) : super(key: key);

  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * .05,
          vertical: Get.height * .15,
        ),
        child: const Center(
          child: Text(
            'در سال ۱۳۹۷، جمع شدیم تا از تجربه‌های‌مان در حوزه فرهنگ و فناوری اطلاعات برای ایجاد، توسعه و سرمایه‌گذاری در کسب‌وکارهای هوشمند در حوزه هنر و فرهنگ و ارائه خدمات در این زمینه استفاده کنیم.',
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffAC3F44)
            ),
          ),
        ),
      ),
    );
  }
}
