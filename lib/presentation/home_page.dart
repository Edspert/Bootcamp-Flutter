import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_edspert/controller/home_page_controller.dart';

/// TODO: untuk menginject controller secara mudah dengan menggunakan GetView
/// alternatif lain bisa dengan menggunakan stateless widget
/// dan buat variable TypeController namaVariable = Get.find<TypeController>();

class MyHomePage extends GetView<HomePageController> {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// TODO: Obx digunakan sebagai parent dari widget yang mempunyai variable observable
            Obx(
              () => Text(
                '${controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
