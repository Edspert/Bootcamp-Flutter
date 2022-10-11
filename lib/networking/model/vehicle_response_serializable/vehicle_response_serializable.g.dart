// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_response_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleResponseSerializable _$VehicleResponseSerializableFromJson(
        Map<String, dynamic> json) =>
    VehicleResponseSerializable(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      vehicleClass: json['vehicle_class'] as String?,
      length: json['length'] as String?,
      pilot: json['pilot'] as String?,
      films:
          (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      nama: json['nama'] as String?,
    );

Map<String, dynamic> _$VehicleResponseSerializableToJson(
        VehicleResponseSerializable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'vehicle_class': instance.vehicleClass,
      'length': instance.length,
      'pilot': instance.pilot,
      'films': instance.films,
      'url': instance.url,
      'nama': instance.nama,
    };
