import 'package:get/get.dart';

import 'edspert_edit_profile_controller.dart';

class EdspertEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EdspertEditProfileController());
  }
}
