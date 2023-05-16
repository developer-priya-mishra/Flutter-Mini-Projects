import 'package:flutter/material.dart';

class FlutterSnackBar extends StatelessWidget {
  static const String path = "/snackBar";
  const FlutterSnackBar({super.key});

  void _showIt(context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 5),
        content: Text("I like pie!"),
        action: SnackBarAction(
          label: "Chow down",
          textColor: Colors.white,
          onPressed: () {
            debugPrint("Gettin' fat!");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showIt(context),
          child: Text("Show it"),
        ),
      ),
    );
  }
}
