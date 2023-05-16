import 'package:flutter/material.dart';

class TextStyling extends StatelessWidget {
  static const String path = "/text-styling";
  const TextStyling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Text Styling"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "My first flutter app",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
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
