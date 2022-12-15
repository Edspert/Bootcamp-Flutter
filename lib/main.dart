import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/presentation/home/home_page.dart';
import 'src/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Disney Characters',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: Routes.homePage,
      getPages: Pages.pages,
    );
  }
}
