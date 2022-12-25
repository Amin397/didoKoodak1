import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SingleMovie/single_movie_controller.dart';
import 'Widgets/build_movie_screen_widget.dart';

class SingleMovieScreen extends StatelessWidget {
  SingleMovieScreen({Key? key}) : super(key: key);

  final SingleMovieController controller = Get.put(SingleMovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            BuildMovieScreenWidget(
              controller:controller,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child:const Image(
        image: AssetImage(
          'assets/images/Backgrounds/single_video_bg.png',
        ),
      ),
    );
  }
}
