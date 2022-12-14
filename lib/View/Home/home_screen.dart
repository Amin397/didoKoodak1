import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller.goToAnimalInfo();
              },
              child: const Text(
                'animals info',
              ),
            ),
            TextButton(
              onPressed: () {
                controller.goToAnimalGame();
              },
              child: const Text(
                'animals game',
              ),
            ),
            TextButton(
              onPressed: () {
                controller.goToSetting();
              },
              child: const Text(
                'settings',
              ),
            ),

          ],
        ),
      ),
    );
  }
}
