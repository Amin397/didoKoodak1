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
    await player.setUrl('https://cdn.pixabay.com/download/audio/2022/08/22/audio_ee05e9861e.mp3?filename=kids-117853.mp3' );
    player.setVolume(.5).whenComplete(() => play());
  }


  void play()async{
    await player.play();
  }

  void offMusic({required bool setOff})async{
    if(setOff){
      player.dispose();
    }else{
      init();
    }
  }


}