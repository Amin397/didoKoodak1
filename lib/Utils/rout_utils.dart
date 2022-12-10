import 'package:get/get.dart';

import '../View/Home/home_screen.dart';

class NameRouts{
  static const String home = '/home';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
      name: NameRouts.home,
      page: () => HomeScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}