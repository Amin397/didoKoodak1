import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../Controller/AlphabetInfo/alphabet_info_controller.dart';
import '../../../Model/AlphabetInfo/alphabet_model.dart';

class BuildSingleAlphabetItemWidget extends StatelessWidget {
  const BuildSingleAlphabetItemWidget(
      {Key? key, required this.controller, required this.letter})
      : super(key: key);

  final AlphabetInfoController controller;
  final AlphabetModel letter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          _buildBg(),
          _buildLetterPart(),
          _buildExamplesPart(),
          _buildAlphabetListPart(),
        ],
      ),
    );
  }

  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Image(
        image: AssetImage(
          'assets/images/Backgrounds/alphabetGameBg.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildLetterPart() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          controller.playLetterSound(
            path: letter.letterVoice,
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            right: Get.width * .09,
            bottom: Get.height * .06,
          ),
          height: Get.height * .7,
          width: Get.width * .35,
          child: Center(
            child: AutoSizeText(
              '${letter.upperLetter} ${letter.lowerLetter}',
              maxLines: 1,
              maxFontSize: 240.0,
              minFontSize: 160.0,
              style: const TextStyle(
                fontSize: 200.0,
                fontFamily: 'xKoodak',
                color: Color(0xffFCEE21),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExamplesPart() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .2,
        ),
        height: Get.height * .8,
        width: Get.width * .13,
        child: Column(
          children: [
            _buildExampleItem(
              example: letter.images.first,
            ),
            const SizedBox(
              height: 20.0,
            ),
            _buildExampleItem(
              example: letter.images[1],
            ),
            const SizedBox(
              height: 12.0,
            ),
            _buildExampleItem(
              example: letter.images.last,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleItem({required AlphabetExamples example}) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: (){
          controller.playLetterSound(
            path: example.exampleVoice,
          );
        },
        child: Container(
          padding: paddingAll8,
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Image(
                    image: AssetImage(
                      example.path,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              AutoSizeText(
                example.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'xKoodak',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlphabetListPart() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .15,
          left: Get.width * .085,
        ),
        // color: Colors.blue,
        padding: paddingAll4,
        height: Get.height * .5,
        width: Get.width * .18,
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Find it',
              style: TextStyle(
                fontFamily: 'xKoodak',
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (_, index) => _buildLetterItem(
                    gridLetter: controller.alphabetList[index],
                    index: index,
                  ),
                  itemCount: controller.alphabetList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterItem({
    required AlphabetModel gridLetter,
    required int index,
  }) {
    return InkWell(
      onTap: (){
        // controller.playLetterSound(
        //   path: gridLetter.letterVoice,
        // );
        controller.goToThisLetter(index:index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: radiusAll6,
          color: (letter.id == gridLetter.id)
              ? const Color(0xFF7EA317)
              : const Color(0xFFC1272D),
          // boxShadow: shadow(),
        ),
        child: Center(
          child: AutoSizeText(
            gridLetter.upperLetter,
            maxLines: 1,
            maxFontSize: 22.0,
            minFontSize: 18.0,
            style: const TextStyle(
              fontFamily: 'xKoodak',
              color: Color(0xfffbb03b),
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
