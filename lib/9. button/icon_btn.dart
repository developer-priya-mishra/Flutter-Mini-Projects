import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  static const String path = "/icon-button";
  const IconBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Icon Button"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            debugPrint("Icon btn");
          },
          color: Colors.red,
          iconSize: 100.0,
          splashColor: Colors.redAccent.shade100,
          icon: Icon(Icons.add_a_photo),
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
