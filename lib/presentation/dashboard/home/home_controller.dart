import 'package:elearning/data/repository/banner_repository.dart';
import 'package:elearning/data/repository/course_repository.dart';
import 'package:elearning/data/services/firebase_auth_service.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';

class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final CourseRepository courseRepository;
  final BannerRepository bannerRepository;

  HomeController(this.firebaseAuthService, this.courseRepository, this.bannerRepository);

  List<CourseData> courseList = [];
  bool isGetCoursesLoading = false;

  // Currently set to static
  String majorName = 'IPA';
  int maxHomeCourseCount = 5;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getCourses() async {
    // Set Loading
    isGetCoursesLoading = true;
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result = await courseRepository.getCourses(
        majorName: majorName,
        email: email,
      );
      isGetCoursesLoading = false;
      courseList = result;
      update();
    }
  }
}
