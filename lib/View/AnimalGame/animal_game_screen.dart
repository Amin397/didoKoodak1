import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Controller/AnimalGame/animal_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const/measures.dart';
import '../../Model/AnimalGame/animal_model.dart';

class AnimalGameScreen extends StatelessWidget {
  AnimalGameScreen({Key? key}) : super(key: key);

  final AnimalGameController controller = Get.put(AnimalGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          children: [
            _buildAnimalsList(),
            _buildMainAnimal(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalItem({
    required AnimalsModel animal,
    required int index,
  }) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: radiusAll16,
      ),
      onTap: () {
        controller.selectAnimal(animal: animal);
      },
      child: Stack(
        children: [
          AnimatedContainer(
            padding: paddingAll16,
            height: double.maxFinite,
            width: double.maxFinite,
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: mainYellowBgColor,
              boxShadow: shadow(),
              borderRadius: radiusAll16,
            ),
            child: Image(
              image: AssetImage(
                animal.imagePath,
              ),
            ),
          ),
          Obx(
            () => InkWell(
              onTap: () {
                controller.selectAnimal(
                  animal: animal,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 400,
                ),
                margin: const EdgeInsets.all(10.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: radiusAll16,
                  boxShadow:
                      (controller.guessTime.isTrue && animal.isSelected.isFalse)
                          ? shadow()
                          : [
                              const BoxShadow(),
                            ],
                ),
                height:
                    (controller.guessTime.isTrue && animal.isSelected.isFalse)
                        ? Get.height * .265
                        : 0.0,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalsList() {
    return Flexible(
      flex: 1,
      child: GetBuilder(
        id: 'shuffle',
        init: controller,
        builder: (ctx) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: paddingAll8,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (_, index) => _buildAnimalItem(
                animal: controller.animalsList[index],
                index: index,
              ),
              itemCount: controller.animalsList.length,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainAnimal() {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.width * .25,
              width: Get.width * .25,
              child: Center(
                child: Obx(
                  () => Image(
                    image: AssetImage(
                      controller.animalsList
                          .singleWhere(
                            (element) =>
                                element.id == controller.randomAnimal.value,
                          )
                          .imagePath,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  controller.startGame();
                },
                child: Container(
                  width: Get.width * .3,
                  height: Get.height * .1,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade600,
                    borderRadius: radiusAll16,
                    boxShadow: shadow(),
                  ),
                  child: Center(
                    child: (controller.isStarted.isTrue)
                        ? Text(
                            controller.timer.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                          )
                        : const Text(
                            'شروع',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
