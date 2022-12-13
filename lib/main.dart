import 'package:dido_koodak1/View/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Utils/rout_utils.dart';

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
      initialRoute: NameRouts.splash,
      home: SplashScreen(),
    ),
  );
}
