import 'package:dido_koodak1/View/ProductList/product_list_screen.dart';
import 'package:dido_koodak1/View/SingleRoom/single_room_screen.dart';
import 'package:get/get.dart';
import '../View/AlphabetGame/alphabet_game_screen.dart';
import '../View/AlphabetInfo/alphabet_info_screen.dart';
import '../View/AnimalGame/animal_game_screen.dart';
import '../View/AnimalInfo/animal_info_screen.dart';
import '../View/Basket/basket_screen.dart';
import '../View/GamesList/games_list_screen.dart';
import '../View/Home/home_screen.dart';
import '../View/IceCreamGame/ice_cream_game_screen.dart';
import '../View/KidsProfile/kids_profile_screen.dart';
import '../View/OrderDetails/order_details_screen.dart';
import '../View/ParentPanel/parent_panel_screen.dart';
import '../View/Report/report_screen.dart';
import '../View/SelectAddress/select_address_screen.dart';
import '../View/SelectAlphabetGame/select_alphabet_game_screen.dart';
import '../View/Setting/Widgets/logic_screen.dart';
import '../View/Setting/setting_screen.dart';
import '../View/Shop/shop_screen.dart';
import '../View/SingleFlore/single_flore_screen.dart';
import '../View/SingleHome/single_home_screen.dart';
import '../View/SingleMovie/single_movie_screen.dart';
import '../View/SinglePodcast/single_podcast_screen.dart';
import '../View/SingleProduct/single_product_screen.dart';
import '../View/SingleTower/single_tower_screen.dart';
import '../View/Splash/splash_screen.dart';

class NameRouts{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String singleHome = '/singleHome';
  static const String animalInfo = '/animalInfo';
  static const String animalGame = '/animalGame';
  static const String setting = '/setting';
  static const String gamesList = '/gamesList';
  static const String alphabetInfo = '/alphabetInfo';
  static const String singleTower = '/singleTower';
  static const String singleMovie = '/singleMovie';
  static const String singlePodcast = '/singlePodcast';
  static const String singleFlore = '/singleFlore';
  static const String singleRoom = '/singleRoom';
  static const String logic = '/logic';
  static const String selectAlphabetGame = '/selectAlphabetGame';
  static const String alphabetGame = '/alphabetGame';
  static const String iceCreamGame = '/iceCreamGame';
  static const String parentPanel = '/parentPanel';
  static const String report = '/report';
  static const String kidsProfile = '/kidsProfile';
  static const String shop = '/shop';
  static const String productList = '/productList';
  static const String singleProduct = '/singleProduct';
  static const String basket = '/basket';
  static const String selectAddress = '/selectAddress';
  static const String orderDetails = '/orderDetails';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
      name: NameRouts.animalInfo,
      page: () => AnimalInfoScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.animalGame,
      page: () => AnimalGameScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.productList,
      page: () => ProductListScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.basket,
      page: () => BasketScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.orderDetails,
      page: () => OrderDetailsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.setting,
      page: () => SettingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.selectAddress,
      page: () => SelectAddressScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleProduct,
      page: () => SingleProductScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.gamesList,
      page: () => GamesListScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.kidsProfile,
      page: () => KidsProfileScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.alphabetInfo,
      page: () => AlphabetInfoScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.alphabetGame,
      page: () => AlphabetGameScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.report,
      page: () => ReportScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleTower,
      page: () => SingleTowerScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.shop,
      page: () => ShopScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleMovie,
      page: () => SingleMovieScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.iceCreamGame,
      page: () => IceCreamGameScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.parentPanel,
      page: () => ParentPanelScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singlePodcast,
      page: () => SinglePodcastScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleFlore,
      page: () => SingleFloreScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.selectAlphabetGame,
      page: () => SelectAlphabetGameScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleRoom,
      page: () => SingleRoomScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.logic,
      page: () => LogicScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleHome,
      page: () => SingleHomeScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}