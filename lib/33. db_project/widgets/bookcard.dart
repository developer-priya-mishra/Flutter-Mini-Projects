import 'package:flutter/material.dart';
import '../model/book.dart';

class BookCard extends StatefulWidget {
  const BookCard({
    super.key,
    required this.book,
    required this.onCardClick,
    required this.onStarClick,
  });
  final Book book;
  final VoidCallback onCardClick;
  final VoidCallback onStarClick;
  @override
  State<StatefulWidget> createState() => BookCardState();
}

class BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardClick,
      child: Card(
          child: SizedBox(
        height: 200.0,
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                widget.book.url.isEmpty
                    ? Hero(
                        tag: widget.book.id,
                        child: Image.network(widget.book.url),
                      )
                    : Container(),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("${widget.book.title} ${widget.book.notes}", maxLines: 10),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: widget.book.starred ? Icon(Icons.star) : Icon(Icons.star_border),
                          color: Colors.black,
                          onPressed: widget.onStarClick,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
