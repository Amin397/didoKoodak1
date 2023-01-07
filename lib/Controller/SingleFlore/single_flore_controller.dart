import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/FloreModel/flore_two_model.dart';
import '../../Model/FloreModel/room_model.dart';

class SingleFloreController extends GetxController {
  int flore = 0;
  int listLength = 0;

  RxInt currentPage = 0.obs;

  late PageController pageController;

  List<RoomModel> roomList = [
    RoomModel(
      id: 0,
      title: 'الفبای انگلیسی',
      video:
          'http://192.168.88.221:8096/Items/da83e701d5b3c2cf7452a43dc81adeb4/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 1,
      title: 'حیوانات',
      video:
          'http://192.168.88.221:8096/Items/9771754865b9b503da2b581ad35a7d5b/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 2,
      title: 'ریاضی',
      video:
          'http://192.168.88.221:8096/Items/01015fad4282ef628cd26988763330af/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 3,
      title: 'الفبای فارسی',
      video:
          'http://192.168.88.221:8096/Items/01b209277284ad8cdafecbcc5672a99e/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
  ];


  List<FloreTwoModel> floreThreeList = [
    FloreTwoModel(
      imagePath: 'assets/images/lastFloreRoomBg1.png',
      singleRoomVideos: [
        VideoModel(
          title: 'قسمت اول',
          videoPath:
          'http://192.168.88.221:8096/Items/ef540166ac77fb978a49c2ac196587ec/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت دوم',
          videoPath:
          'http://192.168.88.221:8096/Items/d2c984563240f4d1693214788d82867e/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
        VideoModel(
          title: 'قسمت سوم',
          videoPath:
          'http://192.168.88.221:8096/Items/fb95e7713a6e554dd8c5e340450aa31d/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img3.png',
        ),
        VideoModel(
          title: 'قسمت چهارم',
          videoPath:
          'http://192.168.88.221:8096/Items/beaf2cb06c775f6d6971902f5b1e6049/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت پنجم',
          videoPath:
          'http://192.168.88.221:8096/Items/6ce1855e742028328b55f538abdaa823/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
      ],
    ),
    FloreTwoModel(
      imagePath: 'assets/images/lastFloreRoomBg2.png',
      singleRoomVideos: [
        VideoModel(
          title: 'قسمت اول',
          videoPath:
          'http://192.168.88.221:8096/Items/ef540166ac77fb978a49c2ac196587ec/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت دوم',
          videoPath:
          'http://192.168.88.221:8096/Items/d2c984563240f4d1693214788d82867e/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
        VideoModel(
          title: 'قسمت سوم',
          videoPath:
          'http://192.168.88.221:8096/Items/fb95e7713a6e554dd8c5e340450aa31d/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img3.png',
        ),
        VideoModel(
          title: 'قسمت چهارم',
          videoPath:
          'http://192.168.88.221:8096/Items/beaf2cb06c775f6d6971902f5b1e6049/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت پنجم',
          videoPath:
          'http://192.168.88.221:8096/Items/6ce1855e742028328b55f538abdaa823/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
      ],
    ),
    FloreTwoModel(
      imagePath: 'assets/images/lastFloreRoomBg3.png',
      singleRoomVideos: [
        VideoModel(
          title: 'قسمت اول',
          videoPath:
          'http://192.168.88.221:8096/Items/ef540166ac77fb978a49c2ac196587ec/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت دوم',
          videoPath:
          'http://192.168.88.221:8096/Items/d2c984563240f4d1693214788d82867e/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
        VideoModel(
          title: 'قسمت سوم',
          videoPath:
          'http://192.168.88.221:8096/Items/fb95e7713a6e554dd8c5e340450aa31d/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img3.png',
        ),
        VideoModel(
          title: 'قسمت چهارم',
          videoPath:
          'http://192.168.88.221:8096/Items/beaf2cb06c775f6d6971902f5b1e6049/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img1.png',
        ),
        VideoModel(
          title: 'قسمت پنجم',
          videoPath:
          'http://192.168.88.221:8096/Items/6ce1855e742028328b55f538abdaa823/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/img2.png',
        ),
      ],
    ),
  ];


  List<FloreTwoModel> floreTwoModel = [
    FloreTwoModel(
      imagePath: 'assets/images/firstVideoBg.png',
      singleRoomVideos: [
        VideoModel(
          title: 'قسمت اول',
          videoPath:
              'http://192.168.88.221:8096/Items/0dc856893721636d2cd4752203f564a5/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت دوم',
          videoPath:
              'http://192.168.88.221:8096/Items/b2a975d0b45c299af6ca0b4d86d3a1b4/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت سوم',
          videoPath:
              'http://192.168.88.221:8096/Items/986c0f03c8c12f80d89ac6bc133674e4/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت چهارم',
          videoPath:
              'http://192.168.88.221:8096/Items/5169e570bf5186a04e81f223735f2a4a/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت پنجم',
          videoPath:
              'http://192.168.88.221:8096/Items/ebac01034c101412841330c990f4a773/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت ششم',
          videoPath:
              'http://192.168.88.221:8096/Items/9a112a74e869f7644bf81e4b260ab3e8/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت هفتم',
          videoPath:
              'http://192.168.88.221:8096/Items/d3b62c5dc1c0aaa4063b7162a670eead/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت هشتم',
          videoPath:
              'http://192.168.88.221:8096/Items/2e33e657e4798d00e4d1be2a110db731/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت نهم',
          videoPath:
              'http://192.168.88.221:8096/Items/dd4550c31128d165629f87ab1e2224bd/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/firstVideoBg.png',
        ),
      ],
    ),
    FloreTwoModel(
      imagePath: 'assets/images/secondVideoBg.png',
      singleRoomVideos: [
        VideoModel(
          title: 'قسمت اول',
          videoPath:
              'http://192.168.88.221:8096/Items/fdee11c176488bea4e6d095c2f4a29ae/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت دوم',
          videoPath:
              'http://192.168.88.221:8096/Items/9e71af8a094f14c3ee3c880688c2afd2/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت سوم',
          videoPath:
              'http://192.168.88.221:8096/Items/6c8984c6f3c23e6ae0bec2d26d1903c3/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت چهارم',
          videoPath:
              'http://192.168.88.221:8096/Items/d01f0b64f10ff08e8547f113160dc270/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت پنجم',
          videoPath:
              'http://192.168.88.221:8096/Items/315de40c31fa79dbee9fddc9150e4863/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت ششم',
          videoPath:
              'http://192.168.88.221:8096/Items/a887cd07c9851546d35bb22e0134d6b3/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت هفتم',
          videoPath:
              'http://192.168.88.221:8096/Items/acff5d11f90cf6d06bf814c5c36f021e/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت هشتم',
          videoPath:
              'http://192.168.88.221:8096/Items/2f119087fc66dc408bfc688b09cccb53/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
        VideoModel(
          title: 'قسمت نهم',
          videoPath:
              'http://192.168.88.221:8096/Items/a5314de0ed74513d1a580517395c1f72/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
          imagePath: 'assets/images/secondVideoBg.png',
        ),
      ],
    ),
  ];

  @override
  void onInit() {
    flore = Get.arguments['flore'];
    pageController = PageController(
      initialPage: currentPage.value,
    );
    initData();
    super.onInit();
  }


  initData(){
    switch(flore){
      case 0:{
        listLength = roomList.length;
        break;
      }
      case 1:{
        listLength = floreTwoModel.length;
        break;
      }
      default:{
        floreTwoModel.clear();
        floreTwoModel.addAll(floreThreeList);
        listLength = floreTwoModel.length;
        break;
      }
    }
  }

  void changePage({required int page}) {
    currentPage(page);
  }

  void doorClick({required RoomModel room}) {
    Get.toNamed(NameRouts.singleMovie, arguments: {
      'path': room.video,
    });
    // switch (flore) {
    //   case 0:
    //     {
    //
    //       break;
    //     }
    //   case 1:
    //     {
    //       break;
    //     }
    //   default:
    //     {
    //       break;
    //     }
    // }
  }

  void doorClick2({required FloreTwoModel room}) {
    Get.toNamed(NameRouts.singleRoom, arguments: {
      'videos': room.singleRoomVideos,
    });
  }
}
