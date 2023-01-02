import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/FloreModel/room_model.dart';

class SingleFloreController extends GetxController {
  int flore = 0;

  RxInt currentPage = 0.obs;

  late PageController pageController;

  List<RoomModel> roomList = [
    RoomModel(
      id: 0,
      title: 'الفبای انگلیسی',
      video: 'http://192.168.88.221:8096/Items/da83e701d5b3c2cf7452a43dc81adeb4/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 1,
      title: 'حیوانات',
      video: 'http://192.168.88.221:8096/Items/9771754865b9b503da2b581ad35a7d5b/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 2,
      title: 'ریاضی',
      video: 'http://192.168.88.221:8096/Items/9771754865b9b503da2b581ad35a7d5b/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
    RoomModel(
      id: 3,
      title: 'الفبای فارسی',
      video: 'http://192.168.88.221:8096/Items/9771754865b9b503da2b581ad35a7d5b/Download?api_key=2d358326f9bd4e7db6d79a4205d9d182',
    ),
  ];

  @override
  void onInit() {



    flore = Get.arguments['flore'];
    pageController = PageController(
      initialPage: currentPage.value,
    );
    super.onInit();
  }

  void changePage({required int page}) {
    currentPage(page);
  }

  void doorClick({required RoomModel room}) {
    switch(flore){
      case 0:{
        Get.toNamed(NameRouts.singleMovie,arguments: {
          'path':room.video,
        });
        break;
      }
      case 1:{
        break;
      }
      default:{
        break;
      }
    }
  }
}
