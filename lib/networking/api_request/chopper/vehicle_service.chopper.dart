// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$VehicleService extends VehicleService {
  _$VehicleService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = VehicleService;

  @override
  Future<Response<dynamic>> getVehicleQT() {
    final $url = 'vehicles';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
