import 'package:json_annotation/json_annotation.dart';

/// TODO: part harus sesuai dengan nama file dari class ini
/// part ini adalah generated class
part 'vehicle_response_serializable.g.dart';

/// TODO: anotation untuk json serializable dengan perubahan key dari snakecase to camelcase
@JsonSerializable(fieldRename: FieldRename.snake)
class VehicleResponseSerializable {
  final String? id;
  final String? name;
  final String? description;
  final String? vehicleClass;
  final String? length;
  final String? pilot;
  final List<String>? films;
  final String? url;
  final String? nama;

  VehicleResponseSerializable({
    this.id,
    this.name,
    this.description,
    this.vehicleClass,
    this.length,
    this.pilot,
    this.films,
    this.url,
    this.nama,
  });

  /// TODO : factory yang akan membuat _$VehicleResponseSerializableFromJson di 'vehicle_response_serializable.g.dart';
  factory VehicleResponseSerializable.fromJson(Map<String, dynamic> json) => _$VehicleResponseSerializableFromJson(json);

  /// TODO : factory yang akan membuat _$VehicleResponseSerializableToJson di 'vehicle_response_serializable.g.dart';
  Map<dynamic, dynamic> toJson() => _$VehicleResponseSerializableToJson(this);
}
