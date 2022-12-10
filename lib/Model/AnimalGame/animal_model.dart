import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AnimalsModel {
  AnimalsModel({
    required this.name,
    required this.id,
    required this.soundPath,
    required this.imagePath,
    required this.isSelected,
    required this.player,
  });

  String name;
  int id;
  String soundPath;
  String imagePath;
  RxBool isSelected;
  AudioPlayer player;
}
