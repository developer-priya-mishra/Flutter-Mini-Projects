import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../model/book.dart';

class BookDatabase {
  static final BookDatabase _bookDatabase = BookDatabase._internal();

  final String tableName = "Books";

  late Database db;

  bool didInit = false;

  static BookDatabase get() {
    return _bookDatabase;
  }

  BookDatabase._internal();

  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return db;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "demo.db");

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "${Book.dbId} STRING PRIMARY KEY,"
          "${Book.dbTitle} TEXT,"
          "${Book.dbUrl} TEXT,"
          "${Book.dbStar} BIT,"
          "${Book.dbNotes} TEXT"
          ")");
    });

    didInit = true;
  }

  Future<Book?> getBook(String id) async {
    var db = await _getDb();
    var result = await db.rawQuery('SELECT * FROM $tableName WHERE ${Book.dbId} ="$id"');
    if (result.isEmpty) return null;
    return Book.fromMap(result[0]);
  }

  Future<List> getBooks(List<String> ids) async {
    var db = await _getDb();
    var idsString = ids.map((it) => '"$it"').join(',');
    var result = await db.rawQuery('SELECT * FROM $tableName WHERE ${Book.dbId} IN($idsString)');
    var books = [];
    for (Map<String, dynamic> item in result) {
      books.add(Book.fromMap(item));
    }
    return books;
  }

  Future<List> getFavoriteBooks() async {
    var db = await _getDb();
    var result = await db.rawQuery('SELECT * FROM $tableName WHERE ${Book.dbStar} ="1"');
    if (result.isEmpty) return [];
    var books = [];
    for (Map<String, dynamic> map in result) {
      books.add(Book.fromMap(map));
    }
    return books;
  }

  Future updateBook(Book book) async {
    var db = await _getDb();
    await db.transaction(
      (txn) {
        return db.rawInsert('INSERT OR REPLACE INTO '
            '$tableName(${Book.dbId}, ${Book.dbTitle}, ${Book.dbUrl}, ${Book.dbStar},${Book.dbNotes})'
            ' VALUES("${book.id}", "${book.title}", "${book.url}", ${book.starred ? 1 : 0}'
            "${book.notes}");
      },
    );
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }
}
