import 'package:chopper/chopper.dart';
import 'package:test_edspert/utilities/app_string.dart';

/// TODO: part harus sesuai dengan nama file dari class ini
/// part ini adalah generated class
part "vehicle_service.chopper.dart";

/// TODO: anotation untuk chopper service
@ChopperApi(baseUrl: AppString.vehicle)
abstract class VehicleService extends ChopperService {
  static VehicleService create([ChopperClient? client]) => _$VehicleService(client);

  @Get()
  Future<Response> getVehicleQT();
}
