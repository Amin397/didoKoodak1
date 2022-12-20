import 'package:dido_koodak1/Model/AlphabetGame/alphabet_model.dart';
import 'package:dido_koodak1/Utils/API/base_http_request_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/API/api_result.dart';
import '../../Utils/API/project_requests_utils.dart';

class AlphabetGameController extends GetxController {
  final ProjectRequestsUtils requestUtils = ProjectRequestsUtils();
  late ApiResult result;
  List<AlphabetModel> alphabetList = [];
  RxBool isLoaded = false.obs;

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: 0,
    );
    getAlphabets();
    super.onInit();
  }

  void getAlphabets() async {
    result = await requestUtils.getAlphabet();

    if (result.isDone) {
      alphabetList = AlphabetModel.listFromJson(result.data);
      isLoaded(true);
    }
  }

  void nextPage() {
    pageController.nextPage(
      duration:const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
    update(['letter']);
  }
}
