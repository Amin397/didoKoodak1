import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SinglePodcast/single_podcast_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/Podcast/podcast_model.dart';

class BuildPodcastPartWidget extends StatelessWidget {
  const BuildPodcastPartWidget(
      {Key? key, required this.controller, required this.podcast})
      : super(key: key);

  final SinglePodcastController controller;
  final PodcastModel podcast;

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
              max: podcast.duration.value.inSeconds.toDouble(),
              value: podcast.position.value.inSeconds.toDouble(),
              onChanged: (value) async {
                controller.changePosition(
                  newPosition: value,
                  podcast: podcast,
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
                    podcast.position.value.toString().split('.').first,
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
                              controller.reload(
                                podcast: podcast,
                              );
                            },
                            child: const Image(
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
                              controller.play(
                                podcast: podcast,
                              );
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
                              controller.pause(
                                podcast: podcast,
                              );
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
                  Text(
                    (podcast.duration.value - podcast.position.value)
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
