import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/SingleMovie/single_movie_controller.dart';
import 'Widgets/build_movie_screen_widget.dart';

class SingleMovieScreen extends StatelessWidget {
  SingleMovieScreen({Key? key}) : super(key: key);

  final SingleMovieController controller = Get.put(SingleMovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            _buildBg(),
            BuildMovieScreenWidget(
              controller: controller,
            ),
            _buildChild(),
          ],
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
          'assets/images/Backgrounds/singleVideoBg.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildChild() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        'assets/images/child.svg',
        height: Get.height * .25,
        width: Get.width * .8,
        color: Colors.blueGrey.shade900,
      ),
    );
  }
}
