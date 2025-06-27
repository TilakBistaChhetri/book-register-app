import 'package:registerapp/features/home/data/data_sources/local/book_local_sources.dart';

import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';
import '../models/book_model.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalSource localSource;


  BookRepositoryImpl({BookLocalSource? localSource})
      : localSource = localSource ?? BookLocalSource();

  @override
  Future<void> addBook(Book book) async {
    final books = await localSource.fetchBooks();
    final exists = books.any((b) => b.id == book.id);
    if (exists) {
      throw Exception('Book with ID ${book.id} already exists');
    }

    books.add(BookModel(
      id: book.id,
      name: book.name,
      author: book.author,
      price: book.price,
      publicationDate: book.publicationDate,
    ));

    await localSource.saveBooks(books);
  }

  @override
  Future<void> deleteBook(String id) async {
    final books = await localSource.fetchBooks();
    books.removeWhere((book) => book.id == id);
    await localSource.saveBooks(books);
  }

  @override
  Future<List<Book>> getBooks() async {
    final books = await localSource.fetchBooks();
    return books;
  }

  @override
  Future<void> updateBook(Book book) async {
    final books = await localSource.fetchBooks();
    final index = books.indexWhere((b) => b.id == book.id);

    if (index == -1) {
      throw Exception('Book with ID ${book.id} not found');
    }

    books[index] = BookModel(
      id: book.id,
      name: book.name,
      author: book.author,
      price: book.price,
      publicationDate: book.publicationDate,
    );

    await localSource.saveBooks(books);
  }
}



