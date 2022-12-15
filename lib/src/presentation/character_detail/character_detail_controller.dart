import 'package:get/get.dart';

import '../../data/models/disney_characters_response.dart';

class CharacterDetailController extends GetxController {
  late CharacterData data;

  @override
  void onInit() {
    super.onInit();

    data = Get.arguments as CharacterData;


  }


}
