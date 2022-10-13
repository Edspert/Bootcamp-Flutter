import 'package:get/get.dart';
import 'package:test_edspert/controller/home_page_controller.dart';

class RegisterController {
  /// bertindak sebagai singleton
  RegisterController._();

  static void init() {
    /// TODO: lazy put akan di instance pada saat variable atau TypeController di panggil
    /// put akan langsung menginstance variable dari awal
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}