import 'package:flutter/material.dart';

class FlutterNetworkImage extends StatelessWidget {
  static const String path = "/network-image";
  const FlutterNetworkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Network Image"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Image.network(
          'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
          height: 200.0,
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
