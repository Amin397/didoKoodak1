import 'package:dido_koodak1/Utils/shakeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math.dart' as math;
import '../../Model/AlphabetGame/alphabet_game_model.dart';
import '../../View/AlphabetGame/Widgets/alphabet_game_over_alert_dialog.dart';

class AlphabetGameController extends GetxController {
  RxInt heartNumber = 3.obs;
  late AlphabetGameModel mainModel;

  late GlobalKey<CustomShakeWidgetState> heart;

  List<AlphabetGameModel> questionList = [
    AlphabetGameModel(
      id: 0,
      isShow: true.obs,
      lowerLetter: 'a',
      upperLetter: 'A',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/apple.png',
          name: 'apple',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Monkey.png',
          name: 'monkey',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Camera.png',
          name: 'camera',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 1,
      isShow: false.obs,
      lowerLetter: 'b',
      upperLetter: 'B',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/ant.png',
          name: 'ant',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/IceCream.png',
          name: 'ice cream',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Bag.png',
          name: 'bag',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 2,
      isShow: false.obs,
      lowerLetter: 'c',
      upperLetter: 'C',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Flag.png',
          name: 'flag',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Camera.png',
          name: 'camera',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Hat.png',
          name: 'hat',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 3,
      isShow: false.obs,
      lowerLetter: 'd',
      upperLetter: 'D',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Dish.png',
          name: 'dish',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Heart.png',
          name: 'heart',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Kid.png',
          name: 'kid',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 4,
      isShow: false.obs,
      lowerLetter: 'e',
      upperLetter: 'E',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Girl.png',
          name: 'girl',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Egg.png',
          name: 'egg',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Jacket.png',
          name: 'jacket',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 5,
      isShow: false.obs,
      lowerLetter: 'f',
      upperLetter: 'F',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Leg.png',
          name: 'leg',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Glass.png',
          name: 'glass',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Fan.png',
          name: 'fan',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 6,
      isShow: false.obs,
      lowerLetter: 'g',
      upperLetter: 'G',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Gift.png',
          name: 'gift',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Island.png',
          name: 'island',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Ox.png',
          name: 'ox',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 7,
      isShow: false.obs,
      lowerLetter: 'h',
      upperLetter: 'H',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Panda.png',
          name: 'panda',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Quill.png',
          name: 'quill',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Hand.png',
          name: 'hand',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 8,
      isShow: false.obs,
      lowerLetter: 'i',
      upperLetter: 'I',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Lemon.png',
          name: 'lemon',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Noodle.png',
          name: 'noodle',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Insect.png',
          name: 'insect',
        ),
      ],
    ),
    AlphabetGameModel(
      id: 9,
      isShow: false.obs,
      lowerLetter: 'j',
      upperLetter: 'J',
      examples: [
        AlphabetGameExamples(
          id: 0,
          imagePath: 'assets/images/Letters/Juice.png',
          name: 'juice',
        ),
        AlphabetGameExamples(
          id: 1,
          imagePath: 'assets/images/Letters/Oil.png',
          name: 'oil',
        ),
        AlphabetGameExamples(
          id: 2,
          imagePath: 'assets/images/Letters/Peach.png',
          name: 'peach',
        ),
      ],
    ),
  ];

  @override
  void onInit() {
    heart = GlobalKey();
    mainModel = questionList.first;
    update(['newQuestion']);
    super.onInit();
  }

  void clickExample({required AlphabetGameExamples example}) {

    if (example.name[0] == mainModel.lowerLetter) {
      shuffleMethod();
    } else {
      heartNumber(heartNumber.value - 1);
      if (heartNumber.value == 0) {
        showGameOverAlert();
      } else {
        heart.currentState!.shake();
      }
    }
  }

  @override
  void dispose() {
    heart.currentState!.dispose();
    super.dispose();
  }

  void shuffleMethod() {
    if (questionList.any((element) => element.isShow.isFalse)) {
      questionList.shuffle();
      if (questionList.first.isShow.isTrue) {
        shuffleMethod();
        update(['newQuestion']);
      } else {
        questionList.first.isShow(true);
        mainModel = questionList.first;
        update(['newQuestion']);
      }
    } else {
      Get.back();
    }
  }

  void showGameOverAlert() async {
    var replay = await showGeneralDialog(
      context: Get.context!,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: const AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: AlphabetGameOverAlertDialog(),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 370),
    );


    if(replay is bool && replay){
      for (var o in questionList) {
        o.isShow(false);
      }
      questionList.first.isShow(true);
      mainModel = questionList.first;
      heartNumber(3);
    }else{
      Get.back();
    }
  }
}
