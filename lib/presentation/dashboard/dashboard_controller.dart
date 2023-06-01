import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedNavIndexObs = 0.obs;
  // int selectedNavIndex = 0;

  void navigateTo(int index) {
    // Obs
    selectedNavIndexObs.value = index;

    // // Set-update
    // selectedNavIndex = index;
    // update();
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
