import 'package:flutter/material.dart';

class FlutterContainer extends StatelessWidget {
  static const String path = "/container";
  const FlutterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Container"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25.0),
          padding: EdgeInsets.all(50.0),
          width: 250.0,
          height: 250.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
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
