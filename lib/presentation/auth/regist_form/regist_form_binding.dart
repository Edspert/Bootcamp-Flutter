import 'package:elearning/data/repository/auth_repository.dart';
import 'package:elearning/data/services/dio_client.dart';
import 'package:elearning/presentation/auth/regist_form/regist_form_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class RegistFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => RegistFormController(authRepository: Get.find<AuthRepository>()));
  }
}
