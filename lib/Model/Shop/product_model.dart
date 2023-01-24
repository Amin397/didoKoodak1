import 'package:dido_koodak1/Model/Shop/product_comment_model.dart';
import 'package:dido_koodak1/Model/Shop/product_gallery_model.dart';
import 'package:get/get.dart';

class ProductModel {
  String title;
  String color;
  String size;
  String price;
  String view;
  double rate;
  int id;
  RxInt count;
  List<ProductGalleryModel> gallery;
  List<ProductCommentModel> comments;

  ProductModel({
    required this.title,
    required this.color,
    required this.size,
    required this.price,
    required this.view,
    required this.rate,
    required this.id,
    required this.count,
    required this.gallery,
    required this.comments,
  });
}
