import 'package:auto_size_text/auto_size_text.dart';
import 'package:dido_koodak1/Const/measures.dart';
import 'package:dido_koodak1/Controller/ProductList/product_list_controller.dart';
import 'package:dido_koodak1/Model/Shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            crossAxisCount: 3,
            childAspectRatio: .8
          ),
          itemBuilder: (BuildContext context, int index) => _buildProductItem(
            product: controller.productList[index],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required ProductModel product,
  }) {
    return Container(
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
            path:product.gallery.first.path,
          ),
          _buildDetail(product:product,),
        ],
      ),
    );
  }

  Widget _buildImage({required String path}) {
    return Flexible(
      flex: 3,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
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
    );
  }

  Widget _buildDetail({required ProductModel product}) {
    return Flexible(
      flex: 2,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radiusAll32,
        ),
        child: Column(
          children: [
            Flexible(flex: 1,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: AutoSizeText(
                product.title,
                maxLines: 2,
                maxFontSize: 20.0,
                minFontSize: 12.0,
                style: TextStyle(
                  color: Colors.blueGrey.shade800,
                  fontSize: 16.0,
                  fontFamily: 'xKoodak',
                ),
              ),
            ),
            ),
            Flexible(flex: 1,),
            Flexible(flex: 1,),
          ],
        ),
      ),
    );
  }
}
