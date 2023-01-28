import 'package:dido_koodak1/Globals/blocs.dart';
import 'package:dido_koodak1/Model/Shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Const/measures.dart';
import '../../../Controller/Basket/basket_controller.dart';

class BuildBasketListItemWidget extends StatelessWidget {
  const BuildBasketListItemWidget({Key? key , required this.controller}) : super(key: key);

  final BasketController controller;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: paddingAll12,
        width: double.maxFinite,
        height: double.maxFinite,
        child: StreamBuilder(
          stream: Blocs.basketBloc.getStream,
          builder: (c, v) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Blocs.basketBloc.basketList.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildProductItem(
                  product: Blocs.basketBloc.basketList[index],
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required ProductModel product,
    required int index,
  }) {
    return Container(
      width: double.maxFinite,
      height: Get.height * .25,
      margin: EdgeInsets.symmetric(
        vertical: Get.height * .02,
        horizontal: Get.width * .01,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0XFFFFE0AF),
                borderRadius: radiusAll20,
                boxShadow: shadow(),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * .15,
                    height: double.maxFinite,
                    child: Center(
                      child: Container(
                        margin: paddingSymmetricH12,
                        height: Get.height * .1,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color(0XFF869DCD),
                          border: Border.all(
                            color: const Color(0XFF5E6E8F),
                            width: 2.0,
                          ),
                          borderRadius: radiusAll32,
                        ),
                        padding: paddingSymmetricH8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onTap: (){
                                controller.removeProduct(product: product,);
                              },
                            ),
                            Obx(
                              () => Text(
                                product.count.value.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                controller.addProduct(product: product,);
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .02,
          ),
          Container(
            width: Get.height * .25,
            height: Get.height * .25,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.4),
              borderRadius: radiusAll20,
            ),
            padding: paddingAll8,
            child: ClipRRect(
              borderRadius: radiusAll20,
              child: Image(
                image: AssetImage(
                  product.gallery
                      .singleWhere((element) => element.isMainImg.isTrue)
                      .path,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
