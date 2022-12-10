import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
  List<Animals> animalsList = [
    Animals(
      name: 'dolphin',
      soundPath: 'assets/sounds/dolphin.wav',
      isSelected: true.obs,
      imagePath: 'assets/images/dolphin.png'
    ),
    Animals(
      name: 'dog',
      soundPath: 'assets/sounds/dog.wav',
      isSelected: false.obs,
      imagePath: 'assets/images/dog.png',
    ),
    Animals(
      name: 'bear',
      soundPath: 'assets/sounds/bear.mp3',
      isSelected: false.obs,
      imagePath: 'assets/images/bear.png'
    ),
    Animals(
      name: 'elephant',
      soundPath: 'assets/sounds/elephant.wav',
      isSelected: false.obs,
      imagePath:'assets/images/elephant.png'
    ),
    Animals(
      name: 'fox',
      soundPath: 'assets/sounds/fox.mp3',
      isSelected: false.obs,
      imagePath:'assets/images/fox.png'
    ),
    Animals(
      name: 'lion',
      soundPath: 'assets/sounds/lion.mp3',
      isSelected: false.obs,
      imagePath:'assets/images/lion.png'
    ),
    Animals(
      name: 'horse',
      soundPath: 'assets/sounds/horse.wav',
      isSelected: false.obs,
      imagePath: 'assets/images/horse.png',
    ),
    Animals(
      name: 'mouse',
      soundPath: 'assets/sounds/mouse.mp3',
      isSelected: false.obs,
      imagePath:'assets/images/mouse.png'
    ),
    Animals(
      name: 'owl',
      soundPath: 'assets/sounds/owl.mp3',
      isSelected: false.obs,
      imagePath:'assets/images/owl.png'
    ),
    Animals(
      name: 'tiger',
      soundPath: 'assets/sounds/tiger.wav',
      isSelected: false.obs,
      imagePath:'assets/images/owl.png',
    ),
    Animals(
      name: 'pig',
      soundPath: 'assets/sounds/pig.mp3',
      isSelected: false.obs,
      imagePath:'assets/images/pig.png',
    ),
  ];

  void playAnimalSound({required Animals animal}) async {
    var player = AudioPlayer();
    await player.setAsset(animal.soundPath);
    player.play().then((value){
      player.dispose();
    });

  }
}

class Animals {
  Animals({
    required this.name,
    required this.soundPath,
    required this.imagePath,
    required this.isSelected,
  });

  String name;
  String soundPath;
  String imagePath;
  RxBool isSelected;
}
