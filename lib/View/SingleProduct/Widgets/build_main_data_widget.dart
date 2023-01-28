import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/SingleProduct/single_product_controller.dart';
import 'package:dido_koodak1/Model/Shop/product_comment_model.dart';
import 'package:dido_koodak1/Utils/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BuildMainDataWidget extends StatelessWidget {
  const BuildMainDataWidget({Key? key, required this.controller})
      : super(key: key);

  final SingleProductController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Get.height * .9,
        width: Get.width * .5,
        margin: EdgeInsets.only(
          right: Get.width * .17,
        ),
        padding: paddingAll24,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('(${controller.product.view})'),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    controller.product.rate.toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  SvgPicture.asset('assets/images/star.svg'),
                ],
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              _buildMainData(),
              SizedBox(
                height: Get.height * .07,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'دیدگاه ها',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'xKoodak',
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              SizedBox(
                width: double.maxFinite,
                height:
                    (controller.product.comments.length * (Get.height * .33)),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.product.comments.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildCommentItem(
                    comment: controller.product.comments[index],
                    index: index,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .07,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentItem({
    required ProductCommentModel comment,
    required int index,
  }) {
    return Container(
      width: double.maxFinite,
      height: Get.height * .3,
      margin: EdgeInsets.symmetric(
        vertical: Get.height * .01,
      ),
      padding: paddingAll12,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: radiusAll16,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: Get.height * .07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        comment.title,
                        maxLines: 2,
                        maxFontSize: 18.0,
                        minFontSize: 12.0,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'xKoodak',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * .02,
                ),
                Container(
                  height: Get.height * .06,
                  width: Get.width * .04,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: radiusAll32,
                    border: Border.all(
                      color: Colors.green.shade800,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      comment.rate.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'خریدار',
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'xKoodak',
                    color: Colors.black54),
              ),
              SizedBox(
                width: Get.width * .03,
              ),
              Text(
                comment.name,
                style: const TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'xKoodak',
                    color: Colors.black54),
              ),
              SizedBox(
                width: Get.width * .03,
              ),
              Text(
                comment.date,
                style: const TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'xKoodak',
                    color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.topRight,
                child: AutoSizeText(
                  comment.text,
                  maxLines: 4,
                  maxFontSize: 16.0,
                  minFontSize: 10.0,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'xKoodak',
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainData() {
    return SizedBox(
      width: double.maxFinite,
      height: Get.height * .45,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              height: Get.height * .4,
              padding: paddingAll12,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: radiusAll20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: Get.height * .07,
                    child: Center(
                      child: Hero(
                        tag: 'title-${controller.index}',
                        child: AutoSizeText(
                          controller.product.title,
                          maxLines: 1,
                          maxFontSize: 18.0,
                          minFontSize: 12.0,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'xKoodak',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      'رنگ : ${controller.product.color}',
                      style: const TextStyle(
                        fontFamily: 'xKoodak',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Text(
                          'ابعاد کالا: ',
                          style: TextStyle(
                            fontFamily: 'xKoodak',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .1,
                        ),
                        Text(
                          controller.product.size,
                          style: const TextStyle(
                            fontFamily: 'xKoodak',
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .03,
                        ),
                        const Text(
                          'میلی متر',
                          style: TextStyle(
                            fontFamily: 'xKoodak',
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Text(
                          'قیمت:  ',
                          style: TextStyle(
                            fontFamily: 'xKoodak',
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .1,
                        ),
                        Text(
                          moneyFormat(
                              price: double.parse(controller.product.price)),
                          style: const TextStyle(
                            fontFamily: 'xKoodak',
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .01,
                        ),
                        const Text(
                          'تومان',
                          style: TextStyle(
                            fontFamily: 'xKoodak',
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .01,
              ),
              height: Get.height * .1,
              width: Get.width * .16,
              child: Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 370),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(child: child,opacity: animation,);
                  },
                  child: controller.product.count.value > 0
                      ? Container(
                          // key: UniqueKey(),
                          height: double.maxFinite,
                          width: double.maxFinite,
                          margin: paddingSymmetricH24,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: radiusAll32,
                            border: Border.all(
                              color: Colors.green.shade800,
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.removeProduct(
                                    product: controller.product,
                                  );
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                controller.product.count.value.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.addProduct(
                                      product: controller.product);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            controller.addProduct(
                              product: controller.product,
                            );
                          },
                          child: SizedBox(
                            // key: UniqueKey(),
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Center(
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: radiusAll32,
                                  border: Border.all(
                                    color: Colors.green.shade800,
                                    width: 2.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'افزودن به سبد خرید',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'xKoodak',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
