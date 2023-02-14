// To parse this JSON data, do
//
//     final bookResponseQuickType = bookResponseQuickTypeFromJson(jsonString);

import 'dart:convert';

BookResponseQuickType bookResponseQuickTypeFromJson(String str) => BookResponseQuickType.fromJson(json.decode(str));

String bookResponseQuickTypeToJson(BookResponseQuickType data) => json.encode(data.toJson());

class BookResponseQuickType {
  BookResponseQuickType({
    required this.error,
    required this.total,
    required this.books,
  });

  final String error;
  final String total;
  final List<Book> books;

  factory BookResponseQuickType.fromJson(Map<String, dynamic> json) => BookResponseQuickType(
    error: json["error"],
    total: json["total"],
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "total": total,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json["title"],
    subtitle: json["subtitle"],
    isbn13: json["isbn13"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "isbn13": isbn13,
    "price": price,
    "image": image,
    "url": url,
  };
}
