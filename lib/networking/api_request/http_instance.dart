import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_edspert/networking/model/vehicle_response_manual.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';
import 'package:test_edspert/networking/model/vehicle_response_serializable/vehicle_response_serializable.dart';
import 'package:test_edspert/utilities/app_string.dart';

class APIRequestHttp {
  APIRequestHttp._();

  static final Uri _uri = Uri.parse(AppString.baseUrl + AppString.vehicle);

  static Future<List<VehicleResponseQT>?> getVehicleQT() async {
    try {
      final result = await http.get(_uri);
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

  static Future<List<VehicleResponseManual>?> getVehicleManual() async {
    try {
      final result = await http.get(_uri);
      final response = jsonDecode(result.body);
      if (response is List) {
        return List<VehicleResponseManual>.from(response.map((data) => VehicleResponseManual.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  static Future<List<VehicleResponseSerializable>?> getVehicleJsonSerializable() async {
    try {
      final result = await http.get(_uri);
      final response = jsonDecode(result.body);
      if (response is List) {
        return List<VehicleResponseSerializable>.from(response.map((data) => VehicleResponseSerializable.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }
}
