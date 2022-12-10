import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Utils/rout_utils.dart';
import 'View/Home/home_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ],
  // );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRout.pages,
      initialRoute: NameRouts.home,
      home: HomeScreen(),
      theme: ThemeData(
        fontFamily: 'cinema',
      ),
    ),
  );
}
