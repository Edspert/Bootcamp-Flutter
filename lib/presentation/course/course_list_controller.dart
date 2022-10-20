import 'package:elearning/data/repository/course_repository.dart';
import 'package:elearning/data/services/firebase_auth_service.dart';
import 'package:get/get.dart';

import '../../data/model/course_response.dart';

class CourseListController extends GetxController {
  final CourseRepository courseRepository;
  final FirebaseAuthService firebaseAuthService;

  CourseListController(this.courseRepository, this.firebaseAuthService);


  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getCourses();
    });
  }
  // Currently set to static
  String majorName = 'IPA';

  List<CourseData> courseList = [];

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result = await courseRepository.getCourses(majorName: majorName, email: email);
      courseList = result;
      update();
    }
  }
}
