import 'package:elearning/src/data/repository/disney_repository_impl.dart';
import 'package:elearning/src/networking/dio_client.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClientImpl());
    Get.lazyPut(() => DisneyRepositoryImpl(dioClient: Get.find<DioClientImpl>()));
    Get.lazyPut(() => HomeController(Get.find<DisneyRepositoryImpl>()));
  }
}
