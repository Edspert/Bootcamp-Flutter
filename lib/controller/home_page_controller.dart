import 'package:get/get.dart';

/// TODO: controller digunakan untuk menyimpan variable, function, integrasi ke plugin
class HomePageController extends GetxController {
  /// TODO: Pembuatan variable yang bersifat observable menggunakan .obs
  final counter = 0.obs;

  /// TODO: Memanipulasi variable menggunakan .value
  void increment() => counter.value++;
}