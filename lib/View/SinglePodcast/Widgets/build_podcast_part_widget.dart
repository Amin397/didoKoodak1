import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SinglePodcast/single_podcast_controller.dart';
import 'package:dido_koodak1/Utils/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPodcastPartWidget extends StatelessWidget {
  const BuildPodcastPartWidget({Key? key, required this.controller})
      : super(key: key);

  final SinglePodcastController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * .2, left: Get.width * .02),
      height: Get.height * .5,
      width: Get.width * .45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => Slider(
              min: 0,
              thumbColor: const Color(0xffDB8686),
              activeColor: const Color(0xffEE3F6C),
              inactiveColor: Colors.white,
              max: controller.duration.value.inSeconds.toDouble(),
              value: controller.position.value.inSeconds.toDouble(),
              onChanged: (value) async {
                controller.changePosition(
                  newPosition: value,
                );
              },
            ),
          ),
          SizedBox(
            height: Get.height * .03,
          ),
          Obx(
            () => SizedBox(
              height: Get.height * .1,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.position.value.toString().split('.').first,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: paddingSymmetricH16,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.reload();
                            },
                            child:const  Image(
                              image: AssetImage(
                                'assets/images/Buttons/reloadButton.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          InkWell(
                            onTap: () {
                              controller.play();
                            },
                            child: const Image(
                              image: AssetImage(
                                'assets/images/Buttons/playButton.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pause();
                            },
                            child: const Image(
                              image: AssetImage(
                                'assets/images/Buttons/pauseButton.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       controller.player.play();
                  //     },
                  //     icon: const Icon(Icons.abc)),
                  Text(
                    (controller.duration.value - controller.position.value)
                        .toString()
                        .split('.')
                        .first,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // GetBuilder(
          //   init: controller,
          //   id: 'duration',
          //   builder: (ctx) => Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         formatTime(controller.position).toString(),
          //       ),
          //       Text(
          //         formatTime(controller.duration - controller.position)
          //             .toString(),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
