import 'package:get/get.dart';

import '../../../data/repository/course_repository.dart';
import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_service.dart';
import 'exercise_list_controller.dart';

class ExerciseListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => ExerciseListController(Get.find<CourseRepository>(), Get.find<FirebaseAuthService>()));
  }
}
