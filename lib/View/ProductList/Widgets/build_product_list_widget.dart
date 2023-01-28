import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/ProductList/product_list_controller.dart';
import 'package:dido_koodak1/Model/Shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/view_utils.dart';

class BuildProductListWidget extends StatelessWidget {
  const BuildProductListWidget({Key? key, required this.controller})
      : super(key: key);

  final ProductListController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(
          right: Get.width * .05,
        ),
        height: Get.height * .8,
        width: Get.width * .75,
        padding: paddingAll18,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: .8),
          itemBuilder: (BuildContext context, int index) => _buildProductItem(
            product: controller.productList[index],
            index: index,
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required ProductModel product,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        controller.goToSingleProduct(
          product: product,
          index: index,
        );
      },
      child: Container(
        margin: paddingAll8,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: radiusAll32,
          color: Colors.white.withOpacity(.5),
        ),
        child: Column(
          children: [
            _buildImage(
              path: product.gallery.first.path,
              index: index,
            ),
            _buildDetail(
              product: product,
              index: index,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage({
    required String path,
    required int index,
  }) {
    return Flexible(
      flex: 3,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: Hero(
            tag: 'product-$index',
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              margin: paddingAll18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radiusAll24,
              ),
              child: Image(
                image: AssetImage(
                  path,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail({
    required ProductModel product,
    required int index,
  }) {
    return Flexible(
      flex: 2,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: paddingAll8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radiusAll32,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Hero(
                  tag: 'title-$index',
                  child: AutoSizeText(
                    product.title,
                    maxLines: 2,
                    maxFontSize: 18.0,
                    minFontSize: 10.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                      fontSize: 14.0,
                      fontFamily: 'xKoodak',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: AutoSizeText(
                    '${moneyFormat(price: double.parse(product.price))}  تومان',
                    maxLines: 2,
                    maxFontSize: 18.0,
                    minFontSize: 10.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                      fontSize: 14.0,
                      fontFamily: 'xKoodak',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 370),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: product.count.value > 0
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
                                    controller.removeProduct(product: product);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  product.count.value.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.addProduct(product: product);
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
                                product: product,
                              );
                            },
                            child: SizedBox(
                              // key: UniqueKey(),
                              height: double.maxFinite,
                              width: double.maxFinite,
                              child: Center(
                                child: Container(
                                  height: double.maxFinite,
                                  width: Get.width * .04,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: radiusAll32,
                                    border: Border.all(
                                      color: Colors.green.shade800,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            // Flexible(flex: 1,),
            // Flexible(flex: 1,),
          ],
        ),
      ),
    );
  }
}
