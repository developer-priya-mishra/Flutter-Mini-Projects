import 'package:flutter/material.dart';

class StylingFloatingActionBtnAndAppBar extends StatelessWidget {
  static const String path = '/styling-floating-action-btn-and-appbar';
  const StylingFloatingActionBtnAndAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Styling Floating Action Button And AppBar"),
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text("My first flutter app")),
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
