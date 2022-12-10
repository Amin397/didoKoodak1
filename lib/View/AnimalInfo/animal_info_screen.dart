import 'package:dido_koodak1/Const/colors.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AnimalInfo/animal_info_controller.dart';
import '../../Controller/Home/home_controller.dart';
import '../../Model/AnimalGame/animal_model.dart';

class AnimalInfoScreen extends StatelessWidget {
  AnimalInfoScreen({Key? key}) : super(key: key);

  final AnimalInfoController controller = Get.put(AnimalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          children: [
            _buildAnimalsList(),
            _buildSingleAnimal(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalItem({
    required AnimalsModel animal,
  }) {
    return Obx(
          () => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: radiusAll16,
        ),
        onTap: () {
          controller.selectAnimal(
            animal: animal,
          );
        },
        child: AnimatedContainer(
          padding: (animal.isSelected.isTrue)
              ? const EdgeInsets.all(6.0)
              : const EdgeInsets.all(24.0),
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: (animal.isSelected.isTrue) ? mainYellowBgColor : mainBgColor,
            boxShadow: shadow(),
            borderRadius: radiusAll16,
          ),
          child: Image(
            image: AssetImage(
              animal.imagePath,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalsList() {
    return Flexible(
      flex: 1,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll8,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (_, index) => _buildAnimalItem(
            animal: controller.animalsList[index],
          ),
          itemCount: controller.animalsList.length,
        ),
      ),
    );
  }

  Widget _buildSingleAnimal() {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => SizedBox(
                width: Get.width * .3,
                height: Get.height * .7,
                child: Image(
                  image: AssetImage(
                    controller.animalsList
                        .singleWhere((element) => element.isSelected.isTrue)
                        .imagePath,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            IconButton(
              onPressed: () {
                controller.playAnimalSound(
                  animal: controller.animalsList
                      .singleWhere((element) => element.isSelected.isTrue),
                );
              },
              icon: const Icon(
                Icons.surround_sound,
              ),
            )
          ],
        ),
      ),
    );
  }
}
