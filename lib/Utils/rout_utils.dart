import 'package:get/get.dart';

import '../View/AlphabetGame/alphabet_game_screen.dart';
import '../View/AnimalGame/animal_game_screen.dart';
import '../View/AnimalInfo/animal_info_screen.dart';
import '../View/GamesList/games_list_screen.dart';
import '../View/Home/home_screen.dart';
import '../View/Setting/setting_screen.dart';
import '../View/SingleHome/single_home_screen.dart';
import '../View/SingleMovie/single_movie_screen.dart';
import '../View/SinglePodcast/single_podcast_screen.dart';
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
  static const String alphabetGame = '/alphabetGame';
  static const String singleTower = '/singleTower';
  static const String singleMovie = '/singleMovie';
  static const String singlePodcast = '/singlePodcast';
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
      name: NameRouts.gamesList,
      page: () => GamesListScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.alphabetGame,
      page: () => AlphabetGameScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleTower,
      page: () => SingleTowerScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singleMovie,
      page: () => SingleMovieScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRouts.singlePodcast,
      page: () => SinglePodcastScreen(),
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