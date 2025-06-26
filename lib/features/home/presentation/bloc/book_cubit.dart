import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book.dart';
import '../../domain/usecases/book_usecases.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookUseCases useCases;

  BookCubit(this.useCases) : super(BookInitial());

  void loadBooks() async {
    emit(BookLoading());
    final books = await useCases.getBooks();
    emit(BookLoaded(books));
  }

  void addBook(Book book) async {
    await useCases.addBook(book);
    loadBooks();
  }

  void updateBook(Book book) async {
    await useCases.updateBook(book);
    loadBooks();
  }

  void deleteBook(String id) async {
    await useCases.deleteBook(id);
    loadBooks();
  }

  void updateBookWithIdChange(String oldId, Book updatedBook) async {
    await useCases.deleteBook(oldId);
    await useCases.addBook(updatedBook);
    loadBooks();
  }
}
