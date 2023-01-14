import 'package:get/get.dart';

class ReportController extends GetxController{



  List<SalesData> data = [
    SalesData('بازی', 100),
    SalesData('آموزشی', 200),
    SalesData('پادکست', 300),
    SalesData('مهارت', 400),
  ];



}class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}