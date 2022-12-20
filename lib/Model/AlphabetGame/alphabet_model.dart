class AlphabetModel {
  AlphabetModel({
    this.id,
    this.letter,
    this.faLetter,
    this.sound,
    this.image1,
    this.image2,
    this.image3,
    this.example1,
    this.example2,
    this.example3,
    this.text,
  });

  int? id;
  String? letter;
  String? faLetter;
  String? sound;
  String? image1;
  String? image2;
  String? image3;
  String? example1;
  String? example2;
  String? example3;
  dynamic text;

  static List<AlphabetModel> listFromJson(List data) =>
      data.map((e) => AlphabetModel.fromJson(e)).toList();

  factory AlphabetModel.fromJson(Map<String, dynamic> json) => AlphabetModel(
        id: json["id"],
        letter: json["letter"],
        faLetter: json["fa_letter"],
        sound: json["sound"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        example1: json["example1"],
        example2: json["example2"],
        example3: json["example3"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "letter": letter,
        "fa_letter": faLetter,
        "sound": sound,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "example1": example1,
        "example2": example2,
        "example3": example3,
        "text": text,
      };
}
