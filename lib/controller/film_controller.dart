import 'package:get/get.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';

class FilmController extends GetxController {
  var films = <VehicleResponseQT>[];

  void getData() async {
    films = await APIRequest.getVehicleQT() as List<VehicleResponseQT>;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
