import 'package:dido_koodak1/View/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Utils/rout_utils.dart';

void main() async {
  await GetStorage.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then(
    (value) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          runApp(
            GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: PageRout.pages,
              initialRoute: NameRouts.splash,
              home: SplashScreen(),
            ),
          );
        },
      );
    },
  );
}
