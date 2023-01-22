class UserModel {
  String userName;
  String mobile;
  String password;
  KidProfile? kidProfile;

  UserModel({
    required this.userName,
    required this.mobile,
    required this.password,
    this.kidProfile,
  });

  Map<String, dynamic> toJson() =>
      {
        "userName": userName,
        "mobile": mobile,
        "password": password,
        "kidProfile": kidProfile!.toJson(),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
          mobile: json['mobile'],
          userName: json['userName'],
          password: json['password'],
          kidProfile: KidProfile.fromJson(json['kidProfile'])
      );
}

class KidProfile {
  String kidName;
  String birthDay;
  int gender;

  KidProfile({
    required this.kidName,
    required this.birthDay,
    required this.gender,
  });


  factory KidProfile.fromJson(Map<String, dynamic> json)=>
      KidProfile(kidName: json['kidName'],
        birthDay: json['birthDay'],
        gender: json['gender'],);

  Map<String, dynamic> toJson() =>
      {
        'kidName': kidName,
        'birthDay': birthDay,
        'gender': gender,
      };
}
