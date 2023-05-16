import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'database.dart';
import '../model/book.dart';

class ParsedResponse<T> {
  ParsedResponse(this.statusCode, this.body);
  final int statusCode;
  final T body;
  bool isOk() {
    return statusCode >= 200 && statusCode < 300;
  }
}

const int noInternet = 404;

class Repository {
  static final Repository _repo = Repository._internal();
  late BookDatabase database;
  static Repository get() {
    return _repo;
  }

  Repository._internal() {
    database = BookDatabase.get();
  }
  Future<ParsedResponse<List<Book>>> getBooks(String input) async {
    http.Response response = await http
        .get(
      Uri.dataFromString(
          "https://www.googleapis.com/books/v1/volumes?q=$input"),
    )
        .catchError((resp) {
      return resp;
    });
    if (response.statusCode != 200) {
      return ParsedResponse(noInternet, []);
    }
//If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return ParsedResponse(response.statusCode, []);
    }
// Decode and go to the items part where the necessary book information is
    List<dynamic> list = jsonDecode(response.body)['items'];
    Map<String, Book> networkBooks = {};
    for (dynamic jsonBook in list) {
      Book book = Book(
          title: jsonBook["volumeInfo"]["title"],
          url: jsonBook["volumeInfo"]["imageLinks"]["smallThumbnail"],
          id: jsonBook["id"]);
      networkBooks[book.id] = book;
    }
    List databaseBook = await database.getBooks([...networkBooks.keys]);
    for (Book book in databaseBook) {
      networkBooks[book.id] = book;
    }
    return ParsedResponse(response.statusCode, [...networkBooks.values]);
  }

  Future updateBook(Book book) async {
    database.updateBook(book);
  }

  Future close() async {
    return database.close();
  }

  Future<List> getFavoriteBooks() {
    return database.getFavoriteBooks();
  }
}
