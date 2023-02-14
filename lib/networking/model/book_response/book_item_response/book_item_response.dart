//"title": "Snowflake: The Definitive Guide",
// "subtitle": "Architecting, Designing, and Deploying on the Snowflake Data Cloud",
// "isbn13": "9781098103828",
// "price": "$53.95",
// "image": "https://itbook.store/img/books/9781098103828.png",
// "url": "https://itbook.store/books/9781098103828"

class BookItemResponseManual {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? price;
  final String? image;
  final String? url;

  BookItemResponseManual({this.title, this.subtitle, this.isbn13, this.price, this.image, this.url});

  factory BookItemResponseManual.fromJson(Map<String, dynamic> json) {
    return BookItemResponseManual(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }
}
