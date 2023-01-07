import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../Globals/blocs.dart';
import '../../Utils/storage_utils.dart';

class SingleMovieController extends GetxController {
  VideoPlayerController? vController;
  ChewieController? cController;

  RxBool isLoaded = false.obs;

  RxBool isMute = false.obs;

  late String videoPath;

  @override
  void onInit() {
    videoPath = Get.arguments['path'];
    initVideo();
    super.onInit();
    Blocs.musicBloc.offMusic(setOff: true);
  }

  void initVideo() async {
    vController = VideoPlayerController.network(videoPath);
    await vController!.initialize();

    cController = ChewieController(
      videoPlayerController: vController!,
      autoPlay: true,
      looping: true,
      showOptions: true,
      showControls: true,
      allowMuting: true,
    );

    isLoaded(true);



    cController!.addListener(() {
      if(cController!.isFullScreen){
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,]);
      }else{
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,]);
      }
    });
  }

  @override
  void dispose() {
    vController!.dispose();
    cController!.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    vController!.dispose();
    cController!.dispose();
    Blocs.musicBloc.checkBgMusic();
    super.onClose();
  }

  void zoom() async {
    cController!.enterFullScreen();
  }

  void reload() async {
    cController!.seekTo(
      const Duration(milliseconds: 0),
    );
  }

  void mute() async {
    if (isMute.isTrue) {
      cController!.setVolume(1.0);
      isMute(false);
    } else {
      cController!.setVolume(0.0);
      isMute(true);
    }
  }

  void pause() async {
    cController!.pause();
  }

  void play() async {
    cController!.play();
  }
}
