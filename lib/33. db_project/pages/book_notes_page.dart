import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../data/repository.dart';
import '../model/book.dart';

class BookNotesPage extends StatefulWidget {
  const BookNotesPage(this.book, {super.key});
  final Book book;
  @override
  State<StatefulWidget> createState() => _BookNotesPageState();
}

class _BookNotesPageState extends State<BookNotesPage> {
  late TextEditingController _textController;
  final subject = PublishSubject<String>();
  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.book.notes);
    subject.stream.debounce((event) => Stream.value(Duration(milliseconds: 400))).listen((text) {
      widget.book.notes = text;
      Repository.get().updateBook(widget.book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Hero(tag: widget.book.id, child: Image.network(widget.book.url)),
            Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                    maxLines: null,
                    decoration: null,
                    controller: _textController,
                    onChanged: (text) => subject.add(text),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
