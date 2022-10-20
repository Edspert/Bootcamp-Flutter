import 'package:get/get.dart';

class ExerciseResultController extends GetxController {
  late String resultScore;

  @override
  void onInit() {
    super.onInit();

    resultScore = Get.arguments as String;
  }
}
