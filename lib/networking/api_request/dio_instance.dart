import 'package:dio/dio.dart';
import 'package:test_edspert/networking/model/vehicle_response_manual.dart';
import 'package:test_edspert/networking/model/vehicle_response_quicktype.dart';
import 'package:test_edspert/networking/model/vehicle_response_serializable/vehicle_response_serializable.dart';
import 'package:test_edspert/utilities/app_string.dart';


/// TODO: sample untuk api request menggunakan dio
class APIRequest {
  APIRequest._();

  static final Dio _dio = Dio()..options.baseUrl = AppString.baseUrl..options.headers = {"Authorization" : "1234346536"};

  static Future<List<VehicleResponseQT>?> getVehicleQT() async {
    try {
      final result = await _dio.get(AppString.vehicle);
      if (result.data is List) {
        return List<VehicleResponseQT>.from(result.data.map((data) => VehicleResponseQT.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  static Future<List<VehicleResponseQT>?> getVehicleQTQueryParam() async {
    try {
      final result = await _dio.get(AppString.vehicle, queryParameters: {'key': '1234'});
      if (result.data is List) {
        return List<VehicleResponseQT>.from(result.data.map((data) => VehicleResponseQT.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  static Future<List<VehicleResponseQT>?> postVehicleQT() async {
    try {
      final result = await _dio.post(AppString.vehicle, data: {"key": "1234"});

      if (result.data is List) {
        return List<VehicleResponseQT>.from(result.data.map((data) => VehicleResponseQT.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  static Future<List<VehicleResponseManual>?> getVehicleManual() async {
    try {
      final result = await _dio.get(AppString.vehicle);
      if (result.data is List) {
        return List<VehicleResponseManual>.from(result.data.map((data) => VehicleResponseManual.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      print('print => $e');
      rethrow;
    }
  }


  static Future<List<VehicleResponseSerializable>?> getVehicleJsonSerializable() async {
    try {
      final result = await _dio.get(AppString.vehicle);
      if (result.data is List) {
        return List<VehicleResponseSerializable>.from(result.data.map((data) => VehicleResponseSerializable.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  static Future<List<VehicleResponseSerializable>?> getError() async {
    try {
      final result = await _dio.get(AppString.vehicle);
      if (result.data is List) {
        throw Exception();
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }
}
