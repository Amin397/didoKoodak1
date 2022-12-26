import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PodcastModel {
  int id;
  String path;
  Rx<Duration> position;
  Rx<Duration> duration;
  AudioPlayer player;
  bool isLoaded;

  PodcastModel({
    required this.id,
    required this.path,
    required this.position,
    required this.duration,
    required this.player,
    required this.isLoaded,
  });
}
