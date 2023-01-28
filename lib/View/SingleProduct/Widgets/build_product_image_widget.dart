import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SingleProduct/single_product_controller.dart';
import 'package:dido_koodak1/Model/Shop/product_gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductImageWidget extends StatelessWidget {
  const BuildProductImageWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleProductController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: Get.height * .85,
        width: Get.width * .3,
        margin: EdgeInsets.only(
          right: Get.width * .04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.maxFinite,
              height: Get.height * .5,
              margin: paddingAll24,
              padding: paddingAll12,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: radiusAll32,
              ),
              child: Hero(
                tag: 'product-${controller.index}',
                child: ClipRRect(
                  borderRadius: radiusAll32,
                  child: Obx(
                    () => Image(
                      image: AssetImage(
                        controller.product.gallery
                            .singleWhere((element) => element.isMainImg.isTrue)
                            .path,
                      ),
                      height: Get.width * .2,
                      width: Get.width * .2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: Get.height * .18,
              child: PageView.builder(
                controller: controller.pageViewController,
                itemCount: controller.product.gallery.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildImageItem(
                  image: controller.product.gallery[index],
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageItem(
      {required ProductGalleryModel image, required int index}) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.setMainImage(
            image: image,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 370),
          height: double.maxFinite,
          width: Get.width * .03,
          margin: (image.isMainImg.isTrue) ? paddingAll6 : paddingAll12,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.3),
            borderRadius: radiusAll10,
          ),
          padding: paddingAll4,
          child: ClipRRect(
            borderRadius: radiusAll10,
            child: Image(
              image: AssetImage(
                image.path,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
