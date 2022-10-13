import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:test_edspert/networking/api_request/chopper/vehicle_service.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';
import 'package:test_edspert/utilities/app_string.dart';

/// TODO: sample untuk api request menggunakan chopper
class APIRequestChopper {
  static final _chopper = ChopperClient(
    baseUrl: AppString.baseUrl,
    services: [VehicleService.create()],
  );

  static Future<List<VehicleResponseQT>?> getVehicleQT() async {
    try {
      final service = _chopper.getService<VehicleService>();
      final result = await service.getVehicleQT();
      final response = jsonDecode(result.body);
      if (response is List) {
        return List<VehicleResponseQT>.from(response.map((data) => VehicleResponseQT.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }
}
