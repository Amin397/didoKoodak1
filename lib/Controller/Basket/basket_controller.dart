import 'package:get/get.dart';

import '../../Globals/blocs.dart';
import '../../Model/Shop/product_model.dart';

class BasketController extends GetxController{


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


}