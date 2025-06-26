import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/book_model.dart';

class BookLocalSource {
  static const String bookKey = 'books';

  Future<void> saveBooks(List<BookModel> books) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(books.map((e) => e.toJson()).toList());
    await prefs.setString(bookKey, jsonString);
  }

  Future<List<BookModel>> fetchBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(bookKey);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => BookModel.fromJson(e)).toList();
  }
}
