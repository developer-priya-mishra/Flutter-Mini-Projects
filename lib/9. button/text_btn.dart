import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  static const String path = "/text-button";
  const TextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Text Button"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(15.0),
            backgroundColor: Colors.red,
          ),
          child: Text("Click me"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Hello");
        },
        backgroundColor: Colors.redAccent,
        child: Text("Add"),
      ),
    );
  }
}
