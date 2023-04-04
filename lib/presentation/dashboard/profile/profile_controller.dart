import 'package:get/get.dart';

import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ProfileController extends GetxController {
  FirebaseAuthService firebaseAuthService;
  ProfileController({
    required this.firebaseAuthService,
  });

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }
}
