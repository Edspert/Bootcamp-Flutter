// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponseSerializable _$BookResponseSerializableFromJson(
        Map<String, dynamic> json) =>
    BookResponseSerializable(
      error: json['error'] as String?,
      total: json['total'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) =>
              BookItemResponseSerializable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookResponseSerializableToJson(
        BookResponseSerializable instance) =>
    <String, dynamic>{
      'error': instance.error,
      'total': instance.total,
      'books': instance.books,
    };
