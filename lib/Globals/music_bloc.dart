import 'dart:async';

import 'package:just_audio/just_audio.dart';

class MusicBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;

  AudioPlayer player = AudioPlayer();

  Future<void> init()async{
    player = AudioPlayer();
    player.setLoopMode(LoopMode.all);
    await player.setAsset('assets/sounds/bgMusic.mp3');
    player.setVolume(.5).whenComplete(() => play());
  }

  void play()async{
    await player.play();
  }

  void offMusic({required bool setOff})async{
    if(setOff){
      await player.pause();
    }else{
      await player.play();
    }
  }


}