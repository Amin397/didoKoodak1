import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:dido_koodak1/Model/AlphabetGame/alphabet_model.dart';
import 'package:dido_koodak1/Utils/API/base_http_request_utils.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/API/api_result.dart';
import '../../Utils/API/project_requests_utils.dart';

class AlphabetGameController extends GetxController {
  List<AlphabetModel> alphabetList = [
    AlphabetModel(upperLetter: 'A',
      lowerLetter: 'a',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/apple.png', text: 'Apple',),
        AlphabetExamples(
          path: 'assets/images/Letters/ant.png', text: 'Ant',),
        AlphabetExamples(
          path: 'assets/images/Letters/alligator.png', text: 'Alligator',),
      ],
      id: 0,),
    AlphabetModel(upperLetter: 'B',
      lowerLetter: 'b',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Banana.png', text: 'Banana',),
        AlphabetExamples(
          path: 'assets/images/Letters/Butter_Fly.png', text: 'Butter Fly',),
        AlphabetExamples(
          path: 'assets/images/Letters/Bag.png', text: 'Bag',),
      ],
      id: 1,),
    AlphabetModel(upperLetter: 'C',
      lowerLetter: 'c',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Banana.png', text: 'Banana',),
        AlphabetExamples(
          path: 'assets/images/Letters/Butter_Fly.png', text: 'Butter Fly',),
        AlphabetExamples(
          path: 'assets/images/Letters/Bag.png', text: 'Bag',),
      ],
      id: 2,),
    AlphabetModel(upperLetter: 'D',
      lowerLetter: 'd',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Banana.png', text: 'Banana',),
        AlphabetExamples(
          path: 'assets/images/Letters/Butter_Fly.png', text: 'Butter Fly',),
        AlphabetExamples(
          path: 'assets/images/Letters/Bag.png', text: 'Bag',),
      ],
      id: 3,),
    AlphabetModel(upperLetter: 'E',
      lowerLetter: 'e',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Banana.png', text: 'Banana',),
        AlphabetExamples(
          path: 'assets/images/Letters/Butter_Fly.png', text: 'Butter Fly',),
        AlphabetExamples(
          path: 'assets/images/Letters/Bag.png', text: 'Bag',),
      ],
      id: 4,),
    AlphabetModel(upperLetter: 'F',
      lowerLetter: 'f',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Fan.png', text: 'Fan',),
        AlphabetExamples(
          path: 'assets/images/Letters/Football.png', text: 'Football',),
        AlphabetExamples(
          path: 'assets/images/Letters/Flag.png', text: 'Flag',),
      ],
      id: 5,),
    AlphabetModel(upperLetter: 'G',
      lowerLetter: 'g',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Gift.png', text: 'Gift',),
        AlphabetExamples(
          path: 'assets/images/Letters/Girl.png', text: 'Girl',),
        AlphabetExamples(
          path: 'assets/images/Letters/Glass.png', text: 'Glass',),
      ],
      id: 6,),
    AlphabetModel(upperLetter: 'H',
      lowerLetter: 'h',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Hat.png', text: 'Hat',),
        AlphabetExamples(
          path: 'assets/images/Letters/Hand.png', text: 'Hand',),
        AlphabetExamples(
          path: 'assets/images/Letters/Heart.png', text: 'Heart',),
      ],
      id: 7,),
    AlphabetModel(upperLetter: 'I',
      lowerLetter: 'i',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/IceCream.png', text: 'Ice Cream',),
        AlphabetExamples(
          path: 'assets/images/Letters/Insect.png', text: 'Insect',),
        AlphabetExamples(
          path: 'assets/images/Letters/Island.png', text: 'Island',),
      ],
      id: 8,),
    AlphabetModel(upperLetter: 'J',
      lowerLetter: 'j',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Jar.png', text: 'Jar',),
        AlphabetExamples(
          path: 'assets/images/Letters/Jacket.png', text: 'Jacket',),
        AlphabetExamples(
          path: 'assets/images/Letters/Juice.png', text: 'Juice',),
      ],
      id: 9,),
    AlphabetModel(upperLetter: 'K',
      lowerLetter: 'k',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Kangaroo.png', text: 'Kangaroo',),
        AlphabetExamples(
          path: 'assets/images/Letters/Knife.png', text: 'Knife',),
        AlphabetExamples(
          path: 'assets/images/Letters/Kid.png', text: 'Kid',),
      ],
      id: 10,),
    AlphabetModel(upperLetter: 'L',
      lowerLetter: 'l',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Lemon.png', text: 'Lemon',),
        AlphabetExamples(
          path: 'assets/images/Letters/Leg.png', text: 'Leg',),
        AlphabetExamples(
          path: 'assets/images/Letters/Lettuce.png', text: 'Lettuce',),
      ],
      id: 11,),
    AlphabetModel(upperLetter: 'M',
      lowerLetter: 'm',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Mouth.png', text: 'Mouth',),
        AlphabetExamples(
          path: 'assets/images/Letters/Monkey.png', text: 'Monkey',),
        AlphabetExamples(
          path: 'assets/images/Letters/Mug.png', text: 'Mug',),
      ],
      id: 12,),
    AlphabetModel(upperLetter: 'N',
      lowerLetter: 'n',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Noodle.png', text: 'Noodle',),
        AlphabetExamples(
          path: 'assets/images/Letters/Nail.png', text: 'Nail',),
        AlphabetExamples(
          path: 'assets/images/Letters/Nurse.png', text: 'Nurse',),
      ],
      id: 13,),
    AlphabetModel(upperLetter: 'O',
      lowerLetter: 'o',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Oil.png', text: 'Oil',),
        AlphabetExamples(
          path: 'assets/images/Letters/Ox.png', text: 'Ox',),
        AlphabetExamples(
          path: 'assets/images/Letters/Olive.png', text: 'Olive',),
      ],
      id: 14,),
    AlphabetModel(upperLetter: 'P',
      lowerLetter: 'p',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Pig.png', text: 'Pig',),
        AlphabetExamples(
          path: 'assets/images/Letters/Peach.png', text: 'Peach',),
        AlphabetExamples(
          path: 'assets/images/Letters/Panda.png', text: 'Panda',),
      ],
      id: 15,),
    AlphabetModel(upperLetter: 'Q',
      lowerLetter: 'q',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Quill.png', text: 'Quill',),
        AlphabetExamples(
          path: 'assets/images/Letters/Quail.png', text: 'Quail',),
        AlphabetExamples(
          path: 'assets/images/Letters/Quarter.png', text: 'Quarter',),
      ],
      id: 16,),
    // AlphabetModel(upperLetter: 'R',
    //   lowerLetter: 'r',
    //   images: [AlphabetExamples(path:),],
    //   id: 17,),
    // AlphabetModel(upperLetter: 'S',
    //   lowerLetter: 's',
    //   images: [AlphabetExamples(path:),],
    //   id: 18,),
    // AlphabetModel(upperLetter: 'T',
    //   lowerLetter: 't',
    //   images: [AlphabetExamples(path:),],
    //   id: 19,),
    // AlphabetModel(upperLetter: 'U',
    //   lowerLetter: 'u',
    //   images: [AlphabetExamples(path:),],
    //   id: 20,),
    // AlphabetModel(upperLetter: 'V',
    //   lowerLetter: 'v',
    //   images: [AlphabetExamples(path:),],
    //   id: 21,),
    // AlphabetModel(upperLetter: 'W',
    //   lowerLetter: 'w',
    //   images: [AlphabetExamples(path:),],
    //   id: 22,),
    // AlphabetModel(upperLetter: 'X',
    //   lowerLetter: 'x',
    //   images: [AlphabetExamples(path:),],
    //   id: 23,),
    // AlphabetModel(upperLetter: 'Y',
    //   lowerLetter: 'y',
    //   images: [AlphabetExamples(path:),],
    //   id: 24,),
    // AlphabetModel(upperLetter: 'Z',
    //   lowerLetter: 'z',
    //   images: [AlphabetExamples(path:),],
    //   id: 25,),
  ];

  late PageController pageController;

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: currentPage.value,
    );
    super.onInit();
  }


  void nextPage() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    );
  }

  void goToHome() {
    Get.offAndToNamed(NameRouts.home);
    Get.delete<AlphabetGameController>();
    Get.delete<SingleHomeController>();
  }

  void changePage({required int page}) {
    currentPage(page);
  }
}
