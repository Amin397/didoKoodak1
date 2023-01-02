import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:dido_koodak1/Model/AlphabetGame/alphabet_model.dart';
import 'package:dido_koodak1/Utils/API/base_http_request_utils.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

import '../../Globals/blocs.dart';
import '../../Model/API/api_result.dart';
import '../../Utils/API/project_requests_utils.dart';
import '../../Utils/storage_utils.dart';

class AlphabetGameController extends GetxController {


  AudioPlayer player = AudioPlayer()..setVolume(1.0);

  void playLetterSound({required String path}) async {
    await player.pause();
    // var player = ;
    await player.setAsset(path);
    await player.play();
  }


  List<AlphabetModel> alphabetList = [
    AlphabetModel(
      upperLetter: 'A',
      lowerLetter: 'a',
      letterVoice: 'assets/sounds/letters/A.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/apple.png',
          text: 'Apple',
          exampleVoice: 'assets/sounds/letters/apple.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/ant.png',
          text: 'Ant',
          exampleVoice: 'assets/sounds/letters/ant.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/alligator.png',
          text: 'Alligator',
          exampleVoice: 'assets/sounds/letters/alligator.mp3',

        ),
      ],
      id: 0,
    ),
    AlphabetModel(
      upperLetter: 'B',
      lowerLetter: 'b',
      letterVoice: 'assets/sounds/letters/B.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Banana.png',
          text: 'Banana',
          exampleVoice: 'assets/sounds/letters/banana.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Butter_Fly.png',
          text: 'Butter Fly',
          exampleVoice: 'assets/sounds/letters/butther fly.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Bag.png',
          text: 'Bag',
          exampleVoice: 'assets/sounds/letters/bag.mp3',
        ),
      ],
      id: 1,
    ),
    AlphabetModel(
      upperLetter: 'C',
      lowerLetter: 'c',
      letterVoice: 'assets/sounds/letters/C.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Car.png',
          text: 'Car',
          exampleVoice: 'assets/sounds/letters/car.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Camera.png',
          text: 'Camera',
          exampleVoice: 'assets/sounds/letters/camera.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/CatLetter.png',
          text: 'Cat',
          exampleVoice: 'assets/sounds/letters/cat.mp3',
        ),
      ],
      id: 2,
    ),
    AlphabetModel(
      upperLetter: 'D',
      lowerLetter: 'd',
      letterVoice: 'assets/sounds/letters/D.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Dish.png',
          text: 'Dish',
          exampleVoice: 'assets/sounds/letters/dish.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Door.png',
          text: 'Door',
          exampleVoice: 'assets/sounds/letters/door.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Duck.png',
          text: 'Duck',
          exampleVoice: 'assets/sounds/letters/duck.mp3',
        ),
      ],
      id: 3,
    ),
    AlphabetModel(
      upperLetter: 'E',
      lowerLetter: 'e',
      letterVoice: 'assets/sounds/letters/E.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Elephant.png',
          text: 'Elephant',
          exampleVoice: 'assets/sounds/letters/elephant.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Egg.png',
          text: 'Egg',
          exampleVoice: 'assets/sounds/letters/egg.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Earth.png',
          text: 'Earth',
          exampleVoice: 'assets/sounds/letters/earth.mp3',
        ),
      ],
      id: 4,
    ),
    AlphabetModel(
      upperLetter: 'F',
      lowerLetter: 'f',
      letterVoice: 'assets/sounds/letters/F.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Fan.png',
          text: 'Fan',
          exampleVoice: 'assets/sounds/letters/fan.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Football.png',
          text: 'Football',
          exampleVoice: 'assets/sounds/letters/football.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Flag.png',
          text: 'Flag',
          exampleVoice: 'assets/sounds/letters/flag.mp3',
        ),
      ],
      id: 5,
    ),
    AlphabetModel(
      upperLetter: 'G',
      lowerLetter: 'g',
      letterVoice: 'assets/sounds/letters/G.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Gift.png',
          text: 'Gift',
          exampleVoice: 'assets/sounds/letters/gift.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Girl.png',
          text: 'Girl',
          exampleVoice: 'assets/sounds/letters/girl.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Glass.png',
          text: 'Glass',
          exampleVoice: 'assets/sounds/letters/glass.mp3',
        ),
      ],
      id: 6,
    ),
    AlphabetModel(
      upperLetter: 'H',
      lowerLetter: 'h',
      letterVoice: 'assets/sounds/letters/H.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Hat.png',
          text: 'Hat',
          exampleVoice: 'assets/sounds/letters/hat.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Hand.png',
          text: 'Hand',
          exampleVoice: 'assets/sounds/letters/hand.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Heart.png',
          text: 'Heart',
          exampleVoice: 'assets/sounds/letters/heart.mp3',
        ),
      ],
      id: 7,
    ),
    AlphabetModel(
      upperLetter: 'I',
      lowerLetter: 'i',
      letterVoice: 'assets/sounds/letters/I.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/IceCream.png',
          text: 'Ice Cream',
          exampleVoice: 'assets/sounds/letters/ice cream.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Insect.png',
          text: 'Insect',
          exampleVoice: 'assets/sounds/letters/insect.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Island.png',
          text: 'Island',
          exampleVoice: 'assets/sounds/letters/island.mp3',
        ),
      ],
      id: 8,
    ),
    AlphabetModel(
      upperLetter: 'J',
      lowerLetter: 'j',
      letterVoice: 'assets/sounds/letters/J.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Jar.png',
          text: 'Jar',
          exampleVoice: 'assets/sounds/letters/jar.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Jacket.png',
          text: 'Jacket',
          exampleVoice: 'assets/sounds/letters/jaket.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Juice.png',
          text: 'Juice',
          exampleVoice: 'assets/sounds/letters/juice.mp3',
        ),
      ],
      id: 9,
    ),
    AlphabetModel(
      upperLetter: 'K',
      lowerLetter: 'k',
      letterVoice: 'assets/sounds/letters/K.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Kangaroo.png',
          text: 'Kangaroo',
          exampleVoice: 'assets/sounds/letters/kangaroo.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Knife.png',
          text: 'Knife',
          exampleVoice: 'assets/sounds/letters/knife.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Kid.png',
          text: 'Kid',
          exampleVoice: 'assets/sounds/letters/kid.mp3',
        ),
      ],
      id: 10,
    ),
    AlphabetModel(
      upperLetter: 'L',
      lowerLetter: 'l',
      letterVoice: 'assets/sounds/letters/L.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Lemon.png',
          text: 'Lemon',
          exampleVoice: 'assets/sounds/letters/lemon.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Leg.png',
          text: 'Leg',
          exampleVoice: 'assets/sounds/letters/leg.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Lettuce.png',
          text: 'Lettuce',
          exampleVoice: 'assets/sounds/letters/lettuce.mp3',
        ),
      ],
      id: 11,
    ),
    AlphabetModel(
      upperLetter: 'M',
      lowerLetter: 'm',
      letterVoice: 'assets/sounds/letters/M.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Mouth.png',
          text: 'Mouth',
          exampleVoice: 'assets/sounds/letters/mouth.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Monkey.png',
          text: 'Monkey',
          exampleVoice: 'assets/sounds/letters/monkey.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Mug.png',
          text: 'Mug',
          exampleVoice: 'assets/sounds/letters/mug.mp3',
        ),
      ],
      id: 12,
    ),
    AlphabetModel(
      upperLetter: 'N',
      lowerLetter: 'n',
      letterVoice: 'assets/sounds/letters/N.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Noodle.png',
          text: 'Noodle',
          exampleVoice: 'assets/sounds/letters/noodle.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Nail.png',
          text: 'Nail',
          exampleVoice: 'assets/sounds/letters/nail.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Nurse.png',
          text: 'Nurse',
          exampleVoice: 'assets/sounds/letters/nurse.mp3',
        ),
      ],
      id: 13,
    ),
    AlphabetModel(
      upperLetter: 'O',
      lowerLetter: 'o',
      letterVoice: 'assets/sounds/letters/O.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Oil.png',
          text: 'Oil',
          exampleVoice: 'assets/sounds/letters/oil.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Ox.png',
          text: 'Ox',
          exampleVoice: 'assets/sounds/letters/ox.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Olive.png',
          text: 'Olive',
          exampleVoice: 'assets/sounds/letters/olive.mp3',
        ),
      ],
      id: 14,
    ),
    AlphabetModel(
      upperLetter: 'P',
      lowerLetter: 'p',
      letterVoice: 'assets/sounds/letters/P.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Pig.png',
          text: 'Pig',
          exampleVoice: 'assets/sounds/letters/pig.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Peach.png',
          text: 'Peach',
          exampleVoice: 'assets/sounds/letters/peach.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Panda.png',
          text: 'Panda',
          exampleVoice: 'assets/sounds/letters/panda.mp3',
        ),
      ],
      id: 15,
    ),
    AlphabetModel(
      upperLetter: 'Q',
      lowerLetter: 'q',
      letterVoice: 'assets/sounds/letters/Q.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Quill.png',
          text: 'Quill',
          exampleVoice: 'assets/sounds/letters/quill.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Quail.png',
          text: 'Quail',
          exampleVoice: 'assets/sounds/letters/quail.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Quarter.png',
          text: 'Quarter',
          exampleVoice: 'assets/sounds/letters/quarter.mp3',
        ),
      ],
      id: 16,
    ),
    AlphabetModel(
      upperLetter: 'R',
      lowerLetter: 'r',
      letterVoice: 'assets/sounds/letters/R.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Rain.png',
          text: 'Rain',
          exampleVoice: 'assets/sounds/letters/rain.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Robot.png',
          text: 'Robot',
          exampleVoice: 'assets/sounds/letters/robot.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/RainBow.png',
          text: 'Rain Bow',
          exampleVoice: 'assets/sounds/letters/rainbow.mp3',
        ),
      ],
      id: 17,
    ),
    AlphabetModel(
      upperLetter: 'S',
      lowerLetter: 's',
      letterVoice: 'assets/sounds/letters/S.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Snow.png',
          text: 'Snow',
          exampleVoice: 'assets/sounds/letters/snow.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Sandwich.png',
          text: 'Sandwich',
          exampleVoice: 'assets/sounds/letters/sandwich.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Snail.png',
          text: 'Snail',
          exampleVoice: 'assets/sounds/letters/snail.mp3',
        ),
      ],
      id: 18,
    ),
    AlphabetModel(
      upperLetter: 'T',
      lowerLetter: 't',
      letterVoice: 'assets/sounds/letters/T.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Tornado.png',
          text: 'Tornado',
          exampleVoice: 'assets/sounds/letters/tornado.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Telephone.png',
          text: 'Telephone',
          exampleVoice: 'assets/sounds/letters/telephone.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Towel.png',
          text: 'Towel',
          exampleVoice: 'assets/sounds/letters/towel.mp3',
        ),
      ],
      id: 19,
    ),
    AlphabetModel(
      upperLetter: 'U',
      lowerLetter: 'u',
      letterVoice: 'assets/sounds/letters/U.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Umbrella.png',
          text: 'Umbrella',
          exampleVoice: 'assets/sounds/letters/umbrella.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Uniform.png',
          text: 'Uniform',
          exampleVoice: 'assets/sounds/letters/uniform.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Unicorn.png',
          text: 'Unicorn',
          exampleVoice: 'assets/sounds/letters/unicorn.mp3',
        ),
      ],
      id: 20,
    ),
    AlphabetModel(
      upperLetter: 'V',
      lowerLetter: 'v',
      letterVoice: 'assets/sounds/letters/V.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Van.png',
          text: 'Van',
          exampleVoice: 'assets/sounds/letters/van.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Violin.png',
          text: 'Violin',
          exampleVoice: 'assets/sounds/letters/violin.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Vegetable.png',
          text: 'Vegetable',
          exampleVoice: 'assets/sounds/letters/vegetable.mp3',
        ),
      ],
      id: 21,
    ),
    AlphabetModel(
      upperLetter: 'W',
      lowerLetter: 'w',
      letterVoice: 'assets/sounds/letters/W.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Watch.png',
          text: 'Watch',
          exampleVoice: 'assets/sounds/letters/watch.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Windows.png',
          text: 'Windows',
          exampleVoice: 'assets/sounds/letters/window.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Waffle.png',
          text: 'Waffle',
          exampleVoice: 'assets/sounds/letters/waffle.mp3',
        ),
      ],
      id: 22,
    ),
    AlphabetModel(
      upperLetter: 'X',
      lowerLetter: 'x',
      letterVoice: 'assets/sounds/letters/X.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Xylophone.png',
          text: 'Xylophone',
          exampleVoice: 'assets/sounds/letters/xylophone.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Xray.png',
          text: 'Xray',
          exampleVoice: 'assets/sounds/letters/xray.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/XmassTree.png',
          text: 'Xmass Tree',
          exampleVoice: 'assets/sounds/letters/xmass tree.mp3',
        ),
      ],
      id: 23,
    ),
    AlphabetModel(
      upperLetter: 'Y',
      lowerLetter: 'y',
      letterVoice: 'assets/sounds/letters/Y.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Yam.png',
          text: 'Yam',
          exampleVoice: 'assets/sounds/letters/yam.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Yogurt.png',
          text: 'Yogurt',
          exampleVoice: 'assets/sounds/letters/yogurt.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Yoyo.png',
          text: 'Yoyo',
          exampleVoice: 'assets/sounds/letters/yoyo.mp3',
        ),
      ],
      id: 24,
    ),
    AlphabetModel(
      upperLetter: 'Z',
      lowerLetter: 'z',
      letterVoice: 'assets/sounds/letters/Z.mp3',
      images: [
        AlphabetExamples(
          path: 'assets/images/Letters/Zebra.png',
          text: 'Zebra',
          exampleVoice: 'assets/sounds/letters/zebra.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Zipper.png',
          text: 'Zipper',
          exampleVoice: 'assets/sounds/letters/zipper.mp3',
        ),
        AlphabetExamples(
          path: 'assets/images/Letters/Zero.png',
          text: 'Zero',
          exampleVoice: 'assets/sounds/letters/zero.mp3',
        ),
      ],
      id: 25,
    ),
  ];

  late PageController pageController;

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: currentPage.value,
    );
    super.onInit();
    Blocs.musicBloc.offMusic(setOff: true);
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




  checkBgMusic()async{
    StorageUtils.getBgMusic().then((value){

      print(value);
      if(value){
        Blocs.musicBloc.offMusic(setOff: false);
      }else{
        Blocs.musicBloc.offMusic(setOff: true);
      }
    });
  }

@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    checkBgMusic();
    super.dispose();
  }
}
