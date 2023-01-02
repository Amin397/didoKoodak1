import 'package:dido_koodak1/Model/Podcast/podcast_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/SinglePodcast/single_podcast_controller.dart';
import 'build_podcast_part_widget.dart';


class BuildPodcastItemWidget extends StatelessWidget {
  const BuildPodcastItemWidget({Key? key , required this.controller , required this.podcast}) : super(key: key);


  final SinglePodcastController controller;
  final PodcastModel podcast;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          _buildBg(),
          BuildPodcastPartWidget(
            controller: controller,
            podcast:podcast,
          ),
          buildCat(),
        ],
      ),
    );
  }

  Widget buildCat() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .6,
          bottom: Get.height * .15
        ),
        height: Get.height * .35,
        width: Get.width * .17,
        child: Image(
          image: AssetImage(
            'assets/images/Characters/cat.png',
          ),
        ),
      ),
    );
  }



  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Image(
        image: AssetImage(
          'assets/images/Backgrounds/singlePodcastBg.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }


}
