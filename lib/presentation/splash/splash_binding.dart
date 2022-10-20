import 'package:elearning/data/repository/auth_repository.dart';
import 'package:elearning/data/services/firebase_auth_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../data/services/dio_client.dart';
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.put(SplashController(
        authRepository: Get.find<AuthRepository>(), firebaseAuthService: Get.find<FirebaseAuthService>()));
  }
}
