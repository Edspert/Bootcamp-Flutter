import 'package:flutter/material.dart';
import 'package:test_edspert/presentation/vehicles_page.dart';
import 'package:test_edspert/utilities/app_string.dart';
import 'package:test_edspert/utilities/enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextButton(onPressed: () => _navigateToListPage(ApiType.dioQT), child: const Text(AppString.dioWithQT)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.dioManual), child: const Text(AppString.dioWithManual)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.dioJsonSerializable), child: const Text(AppString.dioWithJsonSerializable)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.httpQT), child: const Text(AppString.httpQT)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.httpManual), child: const Text(AppString.httpManual)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.httpJsonSerializable), child: const Text(AppString.httpJsonSerializable)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.chopper), child: const Text(AppString.chopper)),
                TextButton(onPressed: () => _navigateToListPage(ApiType.error), child: const Text(AppString.getError)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToListPage(ApiType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        /// TODO: cara melempar parameter dari page ini ke page selanjutnya (VehiclePage)
        /// VehiclePage(type: type) berarti kita akan ke page VehiclePage dengan mengirim data atau parameter type
        builder: (_) => VehiclePage(type: type),
      ),
    );
  }
}
