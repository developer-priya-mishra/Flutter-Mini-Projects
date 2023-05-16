import 'package:flutter/material.dart';

class ScaffoldAppBarCenter extends StatelessWidget {
  static const String path = "/scaffold-appBar-center";
  const ScaffoldAppBarCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Scaffold, AppBar, Center"),
        centerTitle: true,
      ),
      body: Center(child: Text("My first flutter app")),
    );
  }
}
