import 'package:flutter/material.dart';

class PopupMenuBtn extends StatelessWidget {
  static const String path = "/popup-menu-button";
  const PopupMenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Menu Button"),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (String result) {
            debugPrint(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem(
              value: "copy",
              child: Text("Copy"),
            ),
            PopupMenuItem(
              value: "cut",
              child: Text("Cut"),
            ),
            PopupMenuItem(
              value: "paste",
              child: Text("Paste"),
            )
          ],
        ),
      ),
    );
  }
}
