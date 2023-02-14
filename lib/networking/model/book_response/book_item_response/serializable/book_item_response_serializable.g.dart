// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item_response_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookItemResponseSerializable _$BookItemResponseSerializableFromJson(
        Map<String, dynamic> json) =>
    BookItemResponseSerializable(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      isbn13: json['isbn13'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BookItemResponseSerializableToJson(
        BookItemResponseSerializable instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'isbn13': instance.isbn13,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
    };
