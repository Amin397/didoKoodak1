import 'package:dido_koodak1/Model/Shop/product_comment_model.dart';
import 'package:dido_koodak1/Model/Shop/product_gallery_model.dart';
import 'package:get/get.dart';

import '../../Model/Shop/product_model.dart';

class ProductListController extends GetxController {
  List<ProductModel> productList = [
    ProductModel(
      color: 'سبز',
      id: 0,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '198800',
      rate: 4.2,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '45215',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel (
      color: 'سبز',
      id: 1,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '21750',
      rate: 2.1,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '1000',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 2,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '54800',
      rate: 1.7,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '815',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 3,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '198800',
      rate: 4.0,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '124',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 4,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '17600',
      rate: 4.8,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '5542',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product5.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 5,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '198800',
      rate: 3.1,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '18',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product6.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 6,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '112500',
      rate: 3.6,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '24',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 7,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '54000',
      rate: 5.0,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '1354',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
    ProductModel(
      color: 'سبز',
      id: 8,
      title: 'اسباب بازی مدل عروسک کاکتوس',
      count: 0.obs,
      price: '64500',
      rate: 3.9,
      size: '۸۰۰x۲۵۰x۷۲۰',
      view: '2541',
      gallery: [
        ProductGalleryModel(
          id: 0,
          isMainImg: true.obs,
          path: 'assets/images/Products/product3.png',
        ),
        ProductGalleryModel(
          id: 1,
          isMainImg: false.obs,
          path: 'assets/images/Products/product2.png',
        ),
        ProductGalleryModel(
          id: 2,
          isMainImg: false.obs,
          path: 'assets/images/Products/product1.png',
        ),
        ProductGalleryModel(
          id: 3,
          isMainImg: false.obs,
          path: 'assets/images/Products/product4.png',
        ),
        ProductGalleryModel(
          id: 4,
          isMainImg: false.obs,
          path: 'assets/images/Products/product5.png',
        ),
      ],
      comments: [
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
        ProductCommentModel(
          rate: 4.3,
          title: 'زیبا و قشنگ',
          name: 'احمد ذوقی',
          date: '4 بهمن 1401',
          text: 'برای کادو دادن و بچه ها یه چیز جالب و جدیدیه'
              'خانوادگی دوستش داشتیم😊😊',
        ),
      ],
    ),
  ];

  String categoryText = '';


  @override
  void onInit() {
    categoryText = Get.arguments['title'];
    super.onInit();
  }
}
