import 'package:elearning/data/model/exercise_list_response.dart';
import 'package:get/get.dart';

import '../../../data/repository/course_repository.dart';
import '../../../data/services/firebase_auth_service.dart';
import 'exercise_list_page.dart';

class ExerciseListController extends GetxController {
  final CourseRepository courseRepository;
  final FirebaseAuthService firebaseAuthService;

  ExerciseListController(this.courseRepository, this.firebaseAuthService);

  // Currently set to static
  late String courseId;
  late String courseName;

  @override
  void onInit() {
    super.onInit();

    ExerciseListPageArgs args = Get.arguments as ExerciseListPageArgs;
    courseId = args.courseId;
    courseName = args.courseName;

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getExercises();
    });
  }

  List<ExerciseListData> exerciseList = [];

  Future<void> getExercises() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<ExerciseListData> result = await courseRepository.getExercisesByCourse(courseId: courseId, email: email);
      exerciseList = result;
      update();
    }
  }
}
