import 'package:elearning/data/repository/course_repository.dart';
import 'package:get/get.dart';

import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_service.dart';
import 'exercise_questions_form_controller.dart';

class ExerciseQuestionsFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => ExerciseQuestionsFormController(Get.find<CourseRepository>(), Get.find<FirebaseAuthService>()));
  }
}
