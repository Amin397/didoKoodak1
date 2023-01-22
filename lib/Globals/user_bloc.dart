import 'dart:async';
import 'dart:convert';

import '../Model/User/user_model.dart';
import '../Utils/storage_utils.dart';

class UserBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;

  UserModel? user;

  Future init() async {
    StorageUtils.getUserModel().then((value) {
      if (value != null) {
        user = UserModel.fromJson(value);
        sync();
        return true;
      } else {
        return false;
      }
    });
  }

  sync() {
    streamController.sink.add(user);
  }

  void setUserData({required UserModel userModel}) {
    user = userModel;
    sync();
  }
}
