import 'package:json_annotation/json_annotation.dart';
import 'package:test_edspert/networking/model/book_response/book_item_response/serializable/book_item_response_serializable.dart';

part 'book_response_serializable.g.dart';

@JsonSerializable()
class BookResponseSerializable {
  final String? error;
  final String? total;
  final List<BookItemResponseSerializable>? books;

  BookResponseSerializable({this.error, this.total, this.books});

  factory BookResponseSerializable.fromJson(Map<String, dynamic> json) => _$BookResponseSerializableFromJson(json);

  Map<dynamic, dynamic> toJson() => _$BookResponseSerializableToJson(this);
}