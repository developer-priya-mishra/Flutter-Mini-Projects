import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  static const String path = "/elevated-button";
  const ElevatedBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Elevated Button"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(15.0),
            elevation: 2,
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
