import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../Model/AnimalGame/animal_model.dart';

class AnimalInfoController extends GetxController {
  List<AnimalsModel> animalsList = [
    AnimalsModel(
      id: 0,
      name: 'dolphin',
      soundPath: 'assets/sounds/dolphin.wav',
      isSelected: true.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/dolphin.png',
    ),
    AnimalsModel(
      id: 1,
      name: 'dog',
      soundPath: 'assets/sounds/dog.wav',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/dog.png',
    ),
    AnimalsModel(
      id: 2,
      name: 'bear',
      soundPath: 'assets/sounds/bear.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/bear.png',
    ),
    AnimalsModel(
      id: 3,
      name: 'elephant',
      soundPath: 'assets/sounds/elephant.wav',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/elephant.png',
    ),
    AnimalsModel(
      id: 4,
      name: 'fox',
      soundPath: 'assets/sounds/fox.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/fox.png',
    ),
    AnimalsModel(
      id: 5,
      name: 'lion',
      soundPath: 'assets/sounds/lion.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/lion.png',
    ),
    AnimalsModel(
      id: 6,
      name: 'horse',
      soundPath: 'assets/sounds/horse.wav',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/horse.png',
    ),
    AnimalsModel(
      id: 7,
      name: 'mouse',
      soundPath: 'assets/sounds/mouse.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/mouse.png',
    ),
    AnimalsModel(
      id: 8,
      name: 'owl',
      soundPath: 'assets/sounds/owl.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/owl.png',
    ),
    AnimalsModel(
      id: 9,
      name: 'tiger',
      soundPath: 'assets/sounds/tiger.wav',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/tiger.png',
    ),
    AnimalsModel(
      id: 10,
      name: 'pig',
      soundPath: 'assets/sounds/pig.mp3',
      isSelected: false.obs,
      player: AudioPlayer(),
      imagePath: 'assets/images/pig.png',
    ),
  ];

  void playAnimalSound({required AnimalsModel animal}) async {
    for (var element in animalsList) {
      element.player.dispose();
    }
    animal.player = AudioPlayer();

    // var player = ;
    await animal.player.setAsset(animal.soundPath);
    await animal.player.play();
  }

  void selectAnimal({required AnimalsModel animal}) {
    for (var element in animalsList) {
      element.isSelected(false);
    }

    animal.isSelected(true);
  }
}
