import 'package:flutter/material.dart';
import 'package:test_edspert/networking/api_request/chopper_instance.dart';
import 'package:test_edspert/networking/api_request/dio_instance.dart';
import 'package:test_edspert/networking/api_request/http_instance.dart';
import 'package:test_edspert/networking/model/vehicle_response_manual.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';
import 'package:test_edspert/networking/model/vehicle_response_serializable/vehicle_response_serializable.dart';
import 'package:test_edspert/utilities/app_string.dart';
import 'package:test_edspert/utilities/enum.dart';

class VehiclePage extends StatefulWidget {
  final ApiType type;

  const VehiclePage({Key? key, required this.type}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type.name),
      ),
      body: FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot.data as List);
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(AppString.errorSomething),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(AppString.back),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildList(List data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) => _vehicleItem(data[index]),
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.grey),
    );
  }

  Widget _vehicleItem(Object item) {
    if (item is VehicleResponseQT) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.name ?? "",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(item.description ?? "", textAlign: TextAlign.justify),
          ],
        ),
      );
    } else if (item is VehicleResponseManual) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.name ?? "",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(item.description ?? "", textAlign: TextAlign.justify),
          ],
        ),
      );
    } else if (item is VehicleResponseSerializable) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.name ?? "",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(item.description ?? "", textAlign: TextAlign.justify),
          ],
        ),
      );
    } else {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.amber,
      );
    }
  }

  Future _future() {
    switch (widget.type) {
      case ApiType.dioQT:
        return APIRequest.getVehicleQTQueryParam();
        return APIRequest.getVehicleQT();
      case ApiType.dioManual:
        return APIRequest.getVehicleManual();
      case ApiType.dioJsonSerializable:
        return APIRequest.getVehicleJsonSerializable();
      case ApiType.httpQT:
        return APIRequestHttp.getVehicleQT();
      case ApiType.error:
        return APIRequest.getError();
      case ApiType.chopper:
        return APIRequestChopper.getVehicleQT();
      default:
        return APIRequest.getVehicleQT();
    }
  }
}
