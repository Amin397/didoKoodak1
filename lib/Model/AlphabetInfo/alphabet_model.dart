class AlphabetModel {
  AlphabetModel({required this.upperLetter, required this.lowerLetter, required this.images, required this.id , required this.letterVoice});

  String upperLetter;
  String lowerLetter;
  String letterVoice;
  List<AlphabetExamples> images;
  int id;

}


class AlphabetExamples{
  AlphabetExamples({required this.path, required this.text , required this.exampleVoice});

  String path;
  String text;
  String exampleVoice;

}
