import 'package:dido_koodak1/Controller/SingleHome/single_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPodCasts extends StatelessWidget {
  const BuildPodCasts({Key? key, required this.controller}) : super(key: key);

  final SingleHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .6,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.player.play();
            },
            icon: const Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
