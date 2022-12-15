import 'package:elearning/src/presentation/character_detail/character_detail_controller.dart';
import 'package:get/get.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterDetailController());
  }
}
