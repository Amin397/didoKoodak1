import 'dart:async';

import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Model/CatSound/cat_sound_model.dart';
import 'package:just_audio/just_audio.dart';

class CatSoundBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;

  AudioPlayer player = AudioPlayer();

  List<CatSoundModel> soundList = [
    CatSoundModel(
      id: 0,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/welcome.wav',
    ),
    CatSoundModel(
      id: 1,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/tower1.wav',
    ),
    CatSoundModel(
      id: 2,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/tower2.wav',
    ),
    CatSoundModel(
      id: 3,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/carouse1.wav',
    ),
    CatSoundModel(
      id: 4,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/carouse2.wav',
    ),
    CatSoundModel(
      id: 5,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/iceCream.wav',
    ),
    CatSoundModel(
      id: 6,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/shop.wav',
    ),
    CatSoundModel(
      id: 7,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/train1.wav',
    ),
    CatSoundModel(
      id: 8,
      isPlayed: false,
      path: 'assets/sounds/CatVoice/train2.wav',
    ),
  ];

  Future<void> init({required int soundId}) async {

    if(soundId == 0){
      if(!soundList.first.isPlayed){
        player = AudioPlayer();
        player.setLoopMode(LoopMode.off);
        await player.setAsset(
            soundList.singleWhere((element) => element.id == soundId).path);

        Blocs.musicBloc.downVolume();
        player.setVolume(1).whenComplete(() => play());
      }
    }else{
      player = AudioPlayer();
      player.setLoopMode(LoopMode.off);
      await player.setAsset(
          soundList.singleWhere((element) => element.id == soundId).path);

      Blocs.musicBloc.downVolume();
      player.setVolume(1).whenComplete(() => play());
    }
    soundList.singleWhere((element) => element.id == soundId).isPlayed = true;
  }

  void play() async {
    await player.play();
    Blocs.musicBloc.upVolume();
    player.dispose();
  }
}
