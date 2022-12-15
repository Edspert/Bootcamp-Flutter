import 'package:get/get.dart';

import '../../data/models/disney_characters_response.dart';
import '../../data/repository/disney_repository.dart';

class HomeController extends GetxController {
  final DisneyRepository disneyRepository;

  HomeController(this.disneyRepository);

  List<CharacterData> allCharacters = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();

    getDisneyCharacters();
  }

  Future<void> getDisneyCharacters() async {
    allCharacters = await disneyRepository.getAllCharacters();
    update();
  }
}
