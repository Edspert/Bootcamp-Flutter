import 'package:get/get.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';

/// TODO: controller biasanya berisi variable observable dan fungsi dari bussines logic
class VehicleController extends GetxController {
  final vehicle = <VehicleResponseQT>[].obs;

  void getData() async {
    vehicle.value = await APIRequest.getVehicleQT() as List<VehicleResponseQT>;
  }

  /// TODO: oninit adalah fungsi yang berfungsi sama dengan init state
  /// dimana fungsi ini akan di panggil pertama kali dan sekali hanya pada saat class ini di panggil
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
