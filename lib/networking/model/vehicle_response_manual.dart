class VehicleResponseManual {
  final String? id;
  final String? name;
  final String? description;
  final String? vehicleClass;
  final String? length;
  final String? pilot;
  final List<String>? films;
  final String? url;

  VehicleResponseManual({
    this.id,
    this.name,
    this.description,
    this.vehicleClass,
    this.length,
    this.pilot,
    this.films,
    this.url,
  });

  /// TODO: contoh pembuatan model secara manual
  /// semakin banyak properties semakin lama membuat modelnya
  factory VehicleResponseManual.fromJson(Map<String, dynamic> json) {
    List<String> filmList = [];
    for (var item in json['films']) {
      filmList.add(item);
    }

    return VehicleResponseManual(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      vehicleClass: json['vehicle_class'],
      length: json['length'],
      pilot: json['pilot'],
      films: filmList,
      url: json['url'],
    );
  }
}
