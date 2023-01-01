class AlphabetModel {
  AlphabetModel({required this.upperLetter, required this.lowerLetter, required this.images, required this.id});

  String upperLetter;
  String lowerLetter;
  List<AlphabetExamples> images;
  int id;

}


class AlphabetExamples{
  AlphabetExamples({required this.path, required this.text});

  String path;
  String text;

}
