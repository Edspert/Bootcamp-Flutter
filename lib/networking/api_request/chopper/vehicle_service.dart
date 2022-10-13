import 'package:chopper/chopper.dart';
import 'package:test_edspert/utilities/app_string.dart';

part "vehicle_service.chopper.dart";

@ChopperApi(baseUrl: AppString.vehicle)
abstract class VehicleService extends ChopperService {
  static VehicleService create([ChopperClient? client]) => _$VehicleService(client);

  @Get()
  Future<Response> getVehicleQT();

}
