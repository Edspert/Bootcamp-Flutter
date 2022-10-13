import 'dart:convert';

List<VehicleResponseQT> vehicleResponseQTFromJson(String str) => List<VehicleResponseQT>.from(json.decode(str).map((x) => VehicleResponseQT.fromJson(x)));

String vehicleResponseQTToJson(List<VehicleResponseQT> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleResponseQT {
  VehicleResponseQT({
    this.id,
    this.name,
    this.description,
    this.vehicleClass,
    this.length,
    this.pilot,
    this.films,
    this.url,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? vehicleClass;
  final String? length;
  final String? pilot;
  final List<String>? films;
  final String? url;

  /// TODO: membuat model dengan bantuan dari Quicktype.io
  /// butuh beberapa penyesuaian tetapi tidak memakan banyak waktu di banding membuat model secara manual
  factory VehicleResponseQT.fromJson(Map<String, dynamic> json) => VehicleResponseQT(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        vehicleClass: json["vehicle_class"],
        length: json["length"],
        pilot: json["pilot"],
        films: List<String>.from(json["films"].map((x) => x)),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "vehicle_class": vehicleClass,
        "length": length,
        "pilot": pilot,
        "films": List<String>.from(films ?? [].map((x) => x)),
        "url": url,
      };
}
