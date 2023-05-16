import 'package:flutter/material.dart';

class FloatingActionBtn extends StatelessWidget {
  static const String path = '/floating-action-btn';
  const FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: Center(child: Text("My first flutter app")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Hello");
        },
        child: Text("Add"),
      ),
    );
  }
}
