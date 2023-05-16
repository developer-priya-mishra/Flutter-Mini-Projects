import 'package:flutter/material.dart';

class FlutterIcon extends StatelessWidget {
  static const String path = "/icon";
  const FlutterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Icon"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Icon(
          Icons.access_alarm,
          color: Colors.blue,
          size: 100.0,
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
