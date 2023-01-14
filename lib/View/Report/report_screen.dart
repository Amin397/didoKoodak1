import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Report/report_controller.dart';
import 'Widgets/build_report_chart_widget.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);
  final ReportController controller = Get.put(ReportController());

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
            _buildBackButton(),
            _buildContent(),
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

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * .1,
            horizontal: Get.width * .05,
          ),
          child: Image(
            image: const AssetImage(
              'assets/images/Buttons/backButton.png',
            ),
            height: Get.height * .11,
            width: Get.height * .11,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: SizedBox(
        height: Get.height * .7,
        width: Get.width * .4,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildReportChartWidget(
                controller: controller,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * .03,
                ),
                child:const  Text(
                  'فرزند شما در یک ماه گذشته، ۷\nهزار دقیقه در اپ ما وقت گذرانده است. از این مدت، ۱۰۲۴ دقیقه را صرف بازی کرده است. ۱۶۰۰ دقیقه آموزش دیده است. ۲۲۷۳ دقیقه پادکست گوش داده است و ۲۶۵۴ دقیقه را صرف یادگرفتن مهارت کرده است.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0XFFAC3F44),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
