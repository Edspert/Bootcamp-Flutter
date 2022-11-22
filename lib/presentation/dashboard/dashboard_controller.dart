import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedNavIndex = 0.obs;

  void navigateTo(int index) {
    selectedNavIndex.value = index;
  }

  bool isOnline = true;

  @override
  void onInit() {
    super.onInit();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('result: ${result}');
      isOnline = !(result == ConnectivityResult.bluetooth || result == ConnectivityResult.none);
      update();
    });
  }
}
