import 'package:dido_koodak1/Model/User/user_model.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtils {

  static final box = GetStorage();


  static Future<void> setBgMusic({required bool play}) async {
    await box.write(
      'music',
      play,
    );
  }

  static Future<dynamic> getBgMusic() async {
    return box.read(
      'music',
    );
  }

  static Future<void> setUserModel({required Map<String , dynamic> userModel}) async {
    await box.write(
      'user',
      userModel,
    );
  }

  static Future<dynamic> getUserModel() async {
    return box.read(
      'user',
    );
  }

}
