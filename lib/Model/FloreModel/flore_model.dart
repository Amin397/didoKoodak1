
class FloreModel {
  FloreModel({required this.imagePath, required this.singleRoomVideos});

  String imagePath;

  List<VideoModel> singleRoomVideos;

}


class VideoModel{
  VideoModel({required this.title, required this.videoPath , required this.imagePath});

  String title;
  String imagePath;
  String videoPath;

}