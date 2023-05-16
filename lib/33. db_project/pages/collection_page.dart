import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../model/book.dart';
import '../utils/utils.dart';
import '../widgets/bookcard.dart';
import 'book_notes_page.dart';

class CollectionPage extends StatefulWidget {
  static const String path = "/db-project/collection";
  const CollectionPage({super.key});

  @override
  State<StatefulWidget> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<Book> _items = [];
  final bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    Repository.get().getFavoriteBooks().then((books) {
      setState(() {
        _items = books as List<Book>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collection"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            _isLoading ? CircularProgressIndicator() : Container(),
            ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return BookCard(
                  book: _items[index],
                  onCardClick: () {
                    Navigator.of(context).push(FadeRoute(
                      builder: (BuildContext context) => BookNotesPage(_items[index]),
                      settings: RouteSettings(
                        name: '/notes',
                        arguments: const {"isInitialRoute": false},
                      ),
                    ));
                  },
                  onStarClick: () {
                    setState(() {
                      _items[index].starred = !_items[index].starred;
                    });
                    Repository.get().updateBook(_items[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
