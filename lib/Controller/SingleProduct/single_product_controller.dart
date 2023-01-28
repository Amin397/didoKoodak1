import 'package:dido_koodak1/Model/Shop/product_gallery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Globals/blocs.dart';
import '../../Model/Shop/product_model.dart';

class SingleProductController extends GetxController {
  late PageController pageViewController;

  late ProductModel product;

  late int index;

  RxInt currentPage = 1.obs;

  @override
  void onInit() {
    pageViewController = PageController(
      initialPage: currentPage.value,
      viewportFraction: 1 / 3,
    );
    product = Get.arguments['product'];
    index = Get.arguments['index'];
    super.onInit();
  }

  void setMainImage({required ProductGalleryModel image}) {
    for (var o in product.gallery) {
      o.isMainImg(false);
    }
    image.isMainImg(true);
  }

  void addProduct({required ProductModel product}) {
    Blocs.basketBloc.addProductToBasket(
      product: product,
    );
  }

  void removeProduct({required ProductModel product}) {
    Blocs.basketBloc.removeProductFromBasket(
      product: product,
    );
  }

  void goToBasket() {
  }
}
