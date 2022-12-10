import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

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

  Widget _buildAnimalItem({required Animals animal}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 370),
      margin: const EdgeInsets.all(8.0),
      color: Colors.red,
      child: Image(
        image: AssetImage(

        ),
      ),
    );
    // return TextButton(
    //   onPressed: () {
    //     controller.playAnimalSound(animal: animal);
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Text(animal.name),
    //   ),
    // );
  }

  Widget _buildAnimalsList() {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.green,
        height: double.maxFinite,
        width: double.maxFinite,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1
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
    return const Flexible(
      flex: 1,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }
}
