import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/GamesList/games_list_controller.dart';

class GamesListScreen extends StatelessWidget {
  GamesListScreen({Key? key}) : super(key: key);

  final GamesListController controller = Get.put(GamesListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller.goToAlphabetGame();
              },
              child: const Text(
                'alphabet',
              ),
            ),
            TextButton(
              onPressed: () {
                controller.goToAnimalInfo();
              },
              child: const Text(
                'animal info ',
              ),
            ),
            TextButton(
              onPressed: () {
                controller.goToAnimalGame();
              },
              child: const Text(
                'animal Game',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
