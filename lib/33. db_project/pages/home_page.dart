import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String path = "/db-project/home";
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            IconButton(
              icon: Icon(Icons.collections),
              onPressed: () {
                Navigator.pushNamed(context, '/collection');
              },
            ),
          ],
        ),
        body: Center(
          child: Text("Main Page"),
        ));
  }
}
