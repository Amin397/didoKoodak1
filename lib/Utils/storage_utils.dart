import 'package:get_storage/get_storage.dart';

class StorageUtils {

  static final box = GetStorage();


  static Future<void> setBgMusic({required bool play}) async {

    await box.write(
      'music',
      play,
    );
  }

  static Future<bool> getBgMusic() async {
    final box = GetStorage();
    return box.read(
      'music',
    );
  }

}
