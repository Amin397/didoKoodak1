import 'package:dido_koodak1/View/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Utils/rout_utils.dart';
import 'View/SingleMovie/single_movie_screen.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ],
  // );


  await GetStorage.init();



  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRout.pages,
      initialRoute: NameRouts.singleMovie,
      home: SingleMovieScreen(),
    ),
  );
}
