import 'package:get/get.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';

class VehicleController extends GetxController {
  final vehicle = <VehicleResponseQT>[].obs;

  void getData() async {
    vehicle.value = await APIRequest.getVehicleQT() as List<VehicleResponseQT>;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
