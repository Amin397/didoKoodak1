import 'dart:async';
import 'dart:math';

import 'package:dido_koodak1/Model/AnimalGame/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AnimalGameController extends GetxController {
  RxBool isStarted = false.obs;
  RxInt timer = 5.obs;
  RxInt randomAnimal = 0.obs;
  late Timer gameTimer;
  late Timer randomTimer;
  RxBool guessTime = false.obs;

  List<AnimalsModel> animalsList = [
    AnimalsModel(
        id: 0,
        name: 'dolphin',
        soundPath: 'assets/sounds/dolphin.wav',
        isSelected: false.obs,
        player: AudioPlayer(),
        imagePath: 'assets/images/dolphin.png'),
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
        imagePath: 'assets/images/bear.png'),
    AnimalsModel(
        id: 3,
        name: 'elephant',
        soundPath: 'assets/sounds/elephant.wav',
        isSelected: false.obs,
        player: AudioPlayer(),
        imagePath: 'assets/images/elephant.png'),
    AnimalsModel(
        id: 4,
        name: 'fox',
        soundPath: 'assets/sounds/fox.mp3',
        isSelected: false.obs,
        player: AudioPlayer(),
        imagePath: 'assets/images/fox.png'),
    AnimalsModel(
        id: 5,
        name: 'lion',
        soundPath: 'assets/sounds/lion.mp3',
        isSelected: false.obs,
        player: AudioPlayer(),
        imagePath: 'assets/images/lion.png'),
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
        imagePath: 'assets/images/mouse.png'),
    AnimalsModel(
        id: 8,
        name: 'owl',
        soundPath: 'assets/sounds/owl.mp3',
        isSelected: false.obs,
        player: AudioPlayer(),
        imagePath: 'assets/images/owl.png'),
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

  startGame() async {
    if (isStarted.isFalse) {
      animalsList.shuffle();
      update(['shuffle']);
      for (var element in animalsList) {
        element.isSelected(false);
      }
      guessTime(false);
      randomAnimalStart();
      isStarted(true);
      gameTimer = Timer.periodic(const Duration(seconds: 1), (sec) {
        timer.value--;
        if (timer.value == 0) {
          sec.cancel();
          isStarted(false);
          timer(5);
          gameTimer.cancel();
          randomTimer.cancel();
          guessTime(true);
        }
      });
    }
  }

  void randomAnimalStart() {
    randomTimer = Timer.periodic(const Duration(milliseconds: 150), (sec) {
      randomAnimal(Random().nextInt(11));
      if (timer.value == 0) {
        sec.cancel();
        randomTimer.cancel();
      }
    });
  }

  void selectAnimal({required AnimalsModel animal}) async {
    if (guessTime.isTrue) {
      if (!animalsList.any((element) => element.isSelected.isTrue)) {
        animal.isSelected(true);
      }


      // await showDialog(
      //   context: Get.context!,
      //   builder: (BuildContext context) => AlertDialog(
      //     contentPadding: EdgeInsets.zero,
      //     backgroundColor: Colors.transparent,
      //     content: StatusHandGameAlert(
      //       status: (randomAnimal.value == animal.id)?'win':'lose',
      //     ),
      //   ),
      // );
    }
  }
}
