import 'package:elearning/data/repository/benner_repository.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../data/repository/course_repository.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import 'home/home_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() =>
        HomeController(Get.find<FirebaseAuthService>(), Get.find<CourseRepository>(), Get.find<BannerRepository>()));
  }
}
