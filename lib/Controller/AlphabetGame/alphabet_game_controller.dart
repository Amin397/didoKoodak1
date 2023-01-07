import 'package:get/get.dart';

import '../../Model/AlphabetGame/alphabet_game_model.dart';

class AlphabetGameController extends GetxController {
  RxInt heartNumber = 3.obs;
  late AlphabetGameModel mainModel;

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
    mainModel = questionList.first;
    update(['newQuestion']);
    super.onInit();
  }

  void clickExample({required AlphabetGameExamples example}) {
    if(example.name[0] == mainModel.lowerLetter){

    }else{

    }
  }




}
