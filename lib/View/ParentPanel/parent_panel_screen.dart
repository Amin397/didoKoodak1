import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Controller/ParentPanel/parent_panel_controller.dart';

class ParentPanelScreen extends StatelessWidget {
  ParentPanelScreen({Key? key}) : super(key: key);

  final ParentPanelController controller = Get.put(ParentPanelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            _buildAlertBg(),
            _buildCenterText(),
            _buildReportButton(),
            _buildTitle(),
            _buildHomeButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Image(
      image: const AssetImage(
        'assets/images/Backgrounds/splashBg.PNG',
      ),
      height: Get.height,
      width: Get.width,
      fit: BoxFit.fill,
    );
  }

  Widget _buildAlertBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        fit: BoxFit.fill,
        height: Get.height * .8,
        width: Get.height * .9,
      ),
    );
  }

  Widget _buildCenterText() {
    return Center(
      child: SizedBox(
        width: Get.width * .35,
        height: Get.height * .65,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Text(
            'سلام به دیدوپارک خوش آمدید \n\n\n'
            'این‌جا صفحه‌ای است که شما می‌توانید علمکرد فرزندتان را ارزیابی کنید و ببینید آیا او در زمینه رشد مهارت‌هایش پیشرفت داشته یا نه؟\n'
            'بدیهی است که ارزیابی ما با افزایش زمان حضور و فعالیت کودکان شما و افزایش تعداد بازی‌ها، دقیق‌تر خواهد شد.\n'
            'بازی‌های این اپلیکیشن براساس تقویت مهارت‌‌هایی چون افزایش اطلاعات، شناخت محیط و حافظه، طراحی شده‌اند\n',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFFAC3F44),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          controller.goToReportScreen();
        },
        child: Container(
          margin: paddingSymmetricV8,
          height: Get.height * .1,
          width: Get.width * .15,
          child: Stack(
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/Buttons/loginButton.png',
                ),
                height: Get.height * .1,
                width: Get.width * .15,
                fit: BoxFit.fill,
              ),
              const Center(
                child: Text(
                  'دیدن گزارش',
                  style: TextStyle(
                    color: Color(0XFFAC3F44),
                    fontFamily: 'gohar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .1,
          horizontal: Get.width * .05,
        ),
        height: Get.height * .1,
        width: Get.width * .15,
        child: Stack(
          children: [
            Image(
              image: const AssetImage(
                'assets/images/Buttons/loginButton.png',
              ),
              height: Get.height * .1,
              width: Get.width * .15,
              fit: BoxFit.fill,
            ),
            const Center(
              child: Text(
                '...عزیز ',
                style: TextStyle(
                  color: Color(0XFFAC3F44),
                  fontFamily: 'gohar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          controller.goToHome();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * .1,
            horizontal: Get.width * .05,
          ),
          child: Image(
            image: const AssetImage(
              'assets/images/Buttons/homeButton.png',
            ),
            height: Get.height * .13,
            width: Get.height * .13,
          ),
        ),
      ),
    );
  }
}
