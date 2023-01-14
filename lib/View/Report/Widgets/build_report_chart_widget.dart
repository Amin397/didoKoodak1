import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/Report/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BuildReportChartWidget extends StatelessWidget {
  const BuildReportChartWidget({Key? key, required this.controller})
      : super(key: key);

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .5,
      width: double.maxFinite,
      child: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            minimum: 0.0,
            maximum: 1000,
            interval: 100,
          ),
          enableAxisAnimation: true,
          plotAreaBorderColor: Colors.transparent,
          series: <ChartSeries<SalesData, String>>[
            ColumnSeries<SalesData, String>(
              dataSource: controller.data,
              xValueMapper: (SalesData data, _) => data.year,
              yValueMapper: (SalesData data, _) => data.sales,
              name: 'detail',
              color: const Color(0XFF770505),
              borderRadius: BorderRadius.circular(4.0)
            )
          ],
        ),
      ),
    );
  }
}
