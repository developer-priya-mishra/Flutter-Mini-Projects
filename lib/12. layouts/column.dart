import 'package:flutter/material.dart';

class FlutterColumn extends StatelessWidget {
  static const String path = "/column";
  const FlutterColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Column"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Hi, this is Priya"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Chat"),
            ),
            Image.asset(
              'assets/images/birds.png',
              height: 200.0,
            ),
          ],
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
