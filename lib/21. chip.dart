import 'package:flutter/material.dart';

class FlutterChip extends StatelessWidget {
  static const String path = "/chip";
  const FlutterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: Center(
        child: Chip(
          avatar: CircleAvatar(
            backgroundImage: AssetImage("data_repo/img/social/twitter.png"),
          ),
          backgroundColor: Colors.grey.shade300,
          label: Text("@Priya Mishra"),
        ),
      ),
    );
  }
}
