import 'package:flutter/material.dart';

class FlutterRow extends StatelessWidget {
  static const String path = "/row";
  const FlutterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Row"),
        backgroundColor: Colors.red,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Hi, this is Priya"),
          ElevatedButton(
            onPressed: () {},
            child: Text("Chat"),
          ),
          Image.asset(
            'assets/images/birds.png',
            height: 100.0,
            width: 100.0,
          ),
        ],
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
