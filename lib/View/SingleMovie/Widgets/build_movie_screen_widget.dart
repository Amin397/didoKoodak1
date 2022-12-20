import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SingleMovie/single_movie_controller.dart';
import 'package:dido_koodak1/Utils/rout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildMovieScreenWidget extends StatelessWidget {
  const BuildMovieScreenWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleMovieController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .15,
        ),
        height: Get.height * .57,
        width: Get.width * .65,
        child: Row(
          children: [
            _buildLeftPart(),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: radiusAll8,
                  boxShadow: shadow(),
                  gradient: const RadialGradient(
                    colors: [
                      Colors.black54,
                      Colors.black87,
                      Colors.black,
                    ],
                    center: Alignment.center,
                    radius: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            _buildRightPart(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftPart() {
    return SizedBox(
      height: double.maxFinite,
      width: Get.width * .05,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            button: 'assets/images/Buttons/backButton.png',
            func: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          _buildButton(
            button: 'assets/images/Buttons/homeButton.png',
            func: () {
              Get.offAndToNamed(
                NameRouts.home,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRightPart() {
    return Container(
      height: double.maxFinite,
      width: Get.width * .05,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            button: 'assets/images/Buttons/zoomButton.png',
            func: () {
              // Get.back();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildButton(
            button: 'assets/images/Buttons/reloadButton.png',
            func: () {
              // Get.back();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildButton(
            button: 'assets/images/Buttons/muteButton.png',
            func: () {
              // Get.back();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildButton(
            button: 'assets/images/Buttons/pauseButton.png',
            func: () {
              // Get.back();
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildButton(
            button: 'assets/images/Buttons/playButton.png',
            func: () {
              // Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      {required String button, required Null Function() func}) {
    return InkWell(
      onTap: () {
        func();
      },
      child: SizedBox(
        child: Image(
          image: AssetImage(
            button,
          ),
        ),
      ),
    );
  }
}
