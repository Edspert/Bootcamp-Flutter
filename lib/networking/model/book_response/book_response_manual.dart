import 'package:test_edspert/networking/model/book_response/book_item_response/book_item_response.dart';

class BookResponseManual {
  final String? error;
  final String? total;
  final List<BookItemResponseManual>? books;

  BookResponseManual({this.error, this.total, this.books});

  factory BookResponseManual.fromJson(Map<String, dynamic> json) {
    List<BookItemResponseManual> bookList = [];
    if(json['books'] is List) {
      for(var item in json['books']) {
        bookList.add(BookItemResponseManual.fromJson(item)) ;
      }
    }

    return BookResponseManual(error: json['error'], total: json['total'], books:bookList);
  }
}