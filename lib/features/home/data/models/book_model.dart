import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.name,
    required super.author,
    required super.price,
    required super.publicationDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        name: json['name'],
        author: json['author'],
        price: json['price'],
        publicationDate: json['publicationDate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'price': price,
        'publicationDate': publicationDate,
      };
}




