import 'package:elearning/data/repository/benner_repository.dart';
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

  // Currently set to static
  String majorName = 'IPA';

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result = await courseRepository.getCourses(majorName: majorName, email: email);
      courseList = result;
      update();
    }
  }
}
