import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AnimalInfo/animal_info_controller.dart';
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
        child: Stack(
          children: [
            Image(
              image: const AssetImage(
                'assets/images/Backgrounds/gameBg.PNG',
              ),
              height: Get.height,
              width: Get.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Row(
                children: [
                  _buildAnimalsList(),
                  _buildSingleAnimal(),
                ],
              ),
            ),
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
              ? const EdgeInsets.all(2.0)
              : const EdgeInsets.all(12.0),
          duration: const Duration(milliseconds: 300),
          // margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            // color: (animal.isSelected.isTrue) ? mainYellowBgColor : mainBgColor,
            // boxShadow: shadow(),

            borderRadius: radiusAll16,
          ),
          child: Image(
            image: AssetImage(
              animal.imagePath,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalsList() {
    return Flexible(
      flex: 19,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // color: Colors.red,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * .13,
          horizontal: Get.width * .03,
        ),
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
      flex: 20,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => SizedBox(
                  width: Get.width * .25,
                  height: Get.height * .3,
                  child: Image(
                    image: AssetImage(
                      controller.animalsList
                          .singleWhere((element) => element.isSelected.isTrue)
                          .imagePath,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: (){
                  controller.playAnimalSound(
                    animal: controller.animalsList
                        .singleWhere((element) => element.isSelected.isTrue),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * .15,
                    right: Get.width * .1,
                  ),
                  child: Image(
                    image:const AssetImage(
                      'assets/images/Buttons/unmuteButton.png',
                    ),
                    height: Get.height * .08,
                    width: Get.height * .08,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
            // IconButton(
            //   onPressed: () {
            //     controller.playAnimalSound(
            //       animal: controller.animalsList
            //           .singleWhere((element) => element.isSelected.isTrue),
            //     );
            //   },
            //   icon: const Icon(
            //     Icons.surround_sound,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
