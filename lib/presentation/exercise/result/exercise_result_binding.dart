import 'package:elearning/data/repository/course_repository.dart';
import 'package:elearning/presentation/exercise/result/exercise_result_controller.dart';
import 'package:get/get.dart';

import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_service.dart';

class ExerciseResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseResultController());
  }
}
