import 'package:dido_koodak1/Const/fakeData.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Model/FloreModel/flore_model.dart';

class SingleFloreController extends GetxController {
  int flore = 0;
  int listLength = 0;
  RxInt currentPage = 0.obs;
  late PageController pageController;
  List<FloreModel> showList = [];


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
        showList.clear();
        showList = floreOneList;
        listLength = showList.length;
        break;
      }
      case 1:{
        showList.clear();
        showList = floreTwoList;
        listLength = showList.length;
        break;
      }
      default:{
        showList.clear();
        showList = floreThreeList;
        listLength = showList.length;
        break;
      }
    }
  }

  void changePage({required int page}) {
    currentPage(page);
  }

  void doorClick2({required FloreModel room}) {
    Get.toNamed(NameRouts.singleRoom, arguments: {
      'videos': room.singleRoomVideos,
    });
  }
}
