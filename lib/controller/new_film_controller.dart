import 'package:get/get.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';

class NewFilmController extends GetxController {
  var newFilms = <VehicleResponseQT>[].obs;

  void getData() async {
    newFilms.value = await APIRequest.getVehicleQT() as List<VehicleResponseQT>;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
