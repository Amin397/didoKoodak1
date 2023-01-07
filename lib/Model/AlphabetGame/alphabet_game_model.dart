import 'package:get/get.dart';

class AlphabetGameModel {
  int id;
  String upperLetter;
  String lowerLetter;
  RxBool isShow;
  List<AlphabetGameExamples> examples;

  AlphabetGameModel({
    required this.id,
    required this.upperLetter,
    required this.lowerLetter,
    required this.isShow,
    required this.examples,
  });
}

class AlphabetGameExamples {
  String imagePath;
  String name;
  int id;

  AlphabetGameExamples({
    required this.imagePath,
    required this.name,
    required this.id,
  });
}
