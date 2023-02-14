import 'package:json_annotation/json_annotation.dart';

part 'book_item_response_serializable.g.dart';

@JsonSerializable()
class BookItemResponseSerializable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? price;
  final String? image;
  final String? url;

  BookItemResponseSerializable({this.title, this.subtitle, this.isbn13, this.price, this.image, this.url});

  factory BookItemResponseSerializable.fromJson(Map<String, dynamic> json) => _$BookItemResponseSerializableFromJson(json);

  Map<String, dynamic> toJson() => _$BookItemResponseSerializableToJson(this);
}
