import 'package:get/get.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';

/// TODO: controller biasanya berisi variable observable dan fungsi dari bussines logic
/// untuk case controller ini tidak berisi variable observable tetapi membutuhkan fungsi update()
/// untuk mengupdate UI nya, dikarenakan controller ini digunakan pada GetBuilder
class FilmController extends GetxController {
  var films = <VehicleResponseQT>[];

  void getData() async {
    films = await APIRequest.getVehicleQT() as List<VehicleResponseQT>;
    update();
  }

  /// TODO: oninit adalah fungsi yang berfungsi sama dengan init state
  /// dimana fungsi ini akan di panggil pertama kali dan sekali hanya pada saat class ini di panggil
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
