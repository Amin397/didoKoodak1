import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class SinglePodcastController extends GetxController{


  String musicSrc = 'https://cdn.pixabay.com/download/audio/2022/08/22/audio_ee05e9861e.mp3?filename=kids-117853.mp3';


  AudioPlayer player = AudioPlayer();
  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;



  @override
  void onInit() {

    super.onInit();
    initMusicData();
    player.positionStream.listen((event) {
      position.value = event;
    });
  }

  void initMusicData() async{
    player.setUrl(musicSrc).then((value){
      duration(value);
    });
    // await player.play();
    // duration(player.duration!);
    print('duration : ${duration.value}');
  }

  void changePosition({required double newPosition}) async{
    position(Duration(seconds: newPosition.toInt()));
    await player.seek(position.value);
  }


  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    player.dispose();
    super.onClose();
  }

  void reload() async{
    player.seek(Duration.zero);
  }

  void play() async{
    player.play();
  }

  void pause() async{
    player.pause();
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToHome() {
    Get.offAndToNamed(NameRouts.home);
  }
}