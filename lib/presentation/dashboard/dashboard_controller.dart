import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  int selectedNavIndex = 0;

  void navigateTo(int index) {
    selectedNavIndex = index;
    update();
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
