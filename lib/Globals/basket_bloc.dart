import 'dart:async';

import 'package:dido_koodak1/Model/Shop/product_model.dart';

class BasketBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  double sumPrice = 0.0;

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;

  List<ProductModel> basketList = [];
  int sumCount = 0;

  void addProductToBasket({
    required ProductModel product,
  }) {
    if (basketList.any((element) => element.id == product.id)) {
      basketList
          .singleWhere((element) => element.id == product.id)
          .count
          .value++;

    } else {
      product.count.value ++ ;
      basketList.add(product);
    }
    sumPrice = sumPrice + double.parse(product.price);
    sumCount ++ ;
    sync();
  }

  void removeProductFromBasket({
    required ProductModel product,
  }) {
    if (basketList.any((element) => element.id == product.id)) {
      basketList
          .singleWhere((element) => element.id == product.id)
          .count
          .value--;
    } else {
      product.count.value -- ;
      basketList.remove(product);
    }
    sumPrice = sumPrice - double.parse(product.price);
    sumCount -- ;
    sync();
  }

  sync() {
    streamController.sink.add(basketList);
    streamController.sink.add(sumCount);
    streamController.sink.add(sumPrice);
  }
}
