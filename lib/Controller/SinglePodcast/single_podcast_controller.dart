import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:dido_koodak1/Utils/storage_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

import '../../Model/Podcast/podcast_model.dart';

class SinglePodcastController extends GetxController {
  RxInt currentPage = 0.obs;

  late PageController pageController;
  List<PodcastModel> podcastsList = [
    PodcastModel(
      duration: Duration.zero.obs,
      id: 0,
      isLoaded: false,
      path:
          'https://cdn.pixabay.com/download/audio/2022/08/22/audio_ee05e9861e.mp3?filename=kids-117853.mp3',
      player: AudioPlayer(),
      position: Duration.zero.obs,
    ),
    PodcastModel(
      duration: Duration.zero.obs,
      id: 1,
      isLoaded: false,
      path:
          'https://cdn.pixabay.com/download/audio/2022/10/14/audio_84b5738b17.mp3?filename=cinim-brainfluid-122844.mp3',
      player: AudioPlayer(),
      position: Duration.zero.obs,
    ),
    PodcastModel(
      duration: Duration.zero.obs,
      id: 2,
      isLoaded: false,
      path:
          'https://cdn.pixabay.com/download/audio/2022/10/14/audio_84b5738b17.mp3',
      player: AudioPlayer(),
      position: Duration.zero.obs,
    ),
    PodcastModel(
      duration: Duration.zero.obs,
      id: 3,
      isLoaded: false,
      path:
          'https://cdn.pixabay.com/download/audio/2022/11/11/audio_684ca37dc0.mp3?filename=mountain-path-125573.mp3',
      player: AudioPlayer(),
      position: Duration.zero.obs,
    ),
  ];

  @override
  void onInit() {
    pageController = PageController(
      initialPage: currentPage.value,
    );
    super.onInit();
    initMusicData();
    // player.positionStream.listen((event) {
    //   position.value = event;
    // });
  }

  void initMusicData() async {
    for (var o in podcastsList) {
      await o.player.setUrl(o.path).then((value) {
        o.duration(value);
        listener(
          podcast: o,
        );
      });
    }
  }

  void listener({required PodcastModel podcast}) {
    podcast.player.positionStream.listen((event) {
      podcast.position.value = event;
    });
  }

  void changePosition({
    required double newPosition,
    required PodcastModel podcast,
  }) async {
    podcast.position(Duration(seconds: newPosition.toInt()));
    await podcast.player.seek(podcast.position.value);
  }

  @override
  void dispose() {
    for (var element in podcastsList) {
      element.player.dispose();
    }
    checkBgMusic();
    super.dispose();
  }


  checkBgMusic()async{
    StorageUtils.getBgMusic().then((value){
      if(value){
        Blocs.musicBloc.player.play();
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    for (var element in podcastsList) {
      element.player.dispose();
    }
    checkBgMusic();
    super.onClose();
  }

  void reload({required PodcastModel podcast}) async {
    podcast.player.seek(Duration.zero);
  }

  void play({required PodcastModel podcast}) async {
    if(Blocs.musicBloc.player.playing){
      Blocs.musicBloc.player.pause();
    }
    await podcast.player.play();
  }

  void pause({required PodcastModel podcast}) async {
    podcast.player.pause();
  }

  void goToSetting() {
    Get.toNamed(NameRouts.setting);
  }

  void goToHome() {
    Get.offAndToNamed(NameRouts.home);
  }

  void changePage({required bool next}) async {
    for (var o in podcastsList) {
      o.player.pause();
    }
    if (next) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
      );
    } else {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
      );
    }
  }
}
