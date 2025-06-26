import '../entities/book.dart';
import '../repositories/book_repository.dart';

class BookUseCases {
  final BookRepository repository;

  BookUseCases(this.repository);

  Future<List<Book>> getBooks() => repository.getBooks();
  Future<void> addBook(Book book) => repository.addBook(book);
  Future<void> updateBook(Book book) => repository.updateBook(book);
  Future<void> deleteBook(String id) => repository.deleteBook(id);
}