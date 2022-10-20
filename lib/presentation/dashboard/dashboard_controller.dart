import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedNavIndex = 0.obs;

  void navigateTo(int index) => selectedNavIndex.value = index;
}
