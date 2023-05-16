import 'package:flutter/material.dart';

class FlutterTextField1 extends StatelessWidget {
  static const String path = "/textfield";
  const FlutterTextField1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("TextField"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          maxLength: 30,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Enter your fullname",
            prefixIcon: Icon(Icons.account_circle_rounded),
            border: OutlineInputBorder(),
            // border: InputBorder.none,
          ),
          onChanged: (value) {
            debugPrint(value);
          },
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
