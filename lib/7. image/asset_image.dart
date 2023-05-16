import 'package:flutter/material.dart';

class FlutterAssetImage extends StatelessWidget {
  static const String path = "/asset-image";
  const FlutterAssetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Asset Image"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/birds.png',
          height: 200.0,
          // width: 100.0,
          // color: Colors.black,
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
