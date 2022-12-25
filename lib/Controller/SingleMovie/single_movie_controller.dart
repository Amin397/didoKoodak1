import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
  }

  @override
  void dispose() {
    vController!.dispose();
    cController!.dispose();
    super.dispose();
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
