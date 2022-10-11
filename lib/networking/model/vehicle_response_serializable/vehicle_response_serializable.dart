import 'package:json_annotation/json_annotation.dart';

part 'vehicle_response_serializable.g.dart';

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

  factory VehicleResponseSerializable.fromJson(Map<String, dynamic> json) => _$VehicleResponseSerializableFromJson(json);

  Map<dynamic, dynamic> toJson() => _$VehicleResponseSerializableToJson(this);
}
