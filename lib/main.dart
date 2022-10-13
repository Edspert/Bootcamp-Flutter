import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_edspert/presentation/home_page.dart';
import 'package:test_edspert/utilities/register_controller.dart';


void main() {
  /// TODO : jangan lupa untuk init controller getx
  RegisterController.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO : jangan lupa untuk merubah MaterialApp to GetMaterialApp
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

