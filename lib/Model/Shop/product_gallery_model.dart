import 'package:get/get.dart';

class ProductGalleryModel {
  int id;
  RxBool isMainImg;
  String path;

  ProductGalleryModel({
    required this.id,
    required this.isMainImg,
    required this.path,
  });
}
