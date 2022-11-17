import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/model/user_response.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  SplashController({
    required this.authRepository,
    required this.firebaseAuthService,
  });

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
      await isUserSignedIn();
    });
  }

  Future<void> isUserSignedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await isUserRegistered();
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> isUserRegistered() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      UserData? userData = await authRepository.getUserByEmail(email: email);
      if (userData != null) {
        // User is Registered
        // Navigate to Dashboard Page
        Get.offAllNamed(Routes.dashboard);
      } else {
        // User is Signed In & Is not Registered
        // Navigate to Register Form Page
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }
}
