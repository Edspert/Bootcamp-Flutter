import 'package:elearning/src/presentation/character_detail/character_detail_binding.dart';
import 'package:elearning/src/presentation/home/home_binding.dart';
import 'package:get/get.dart';

import '../data/models/disney_characters_response.dart';
import '../presentation/character_detail/character_detail_page.dart';
import '../presentation/home/home_page.dart';

class Routes {
  static String homePage = '/';
  static String characterDetailPage = '/characterDetailPage';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.characterDetailPage,
      page: () => const CharacterDetailPage(),
      binding: CharacterDetailBinding(),
      arguments: CharacterData,
    ),
  ];
}
