import 'package:get/get.dart';
import 'package:test_edspert/controller/film_controller.dart';
import 'package:test_edspert/controller/vehicle_controller.dart';

class RegisterController {
  RegisterController._();

  static void init() {
    Get.lazyPut<VehicleController>(() => VehicleController());
    Get.lazyPut<FilmController>(() => FilmController());
  }
}