import 'package:flutter/material.dart';

class FlutterListTile extends StatelessWidget {
  static const String path = "/list-tile";
  const FlutterListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("ListTile"),
        backgroundColor: Colors.red,
      ),
      body: ListTile(
        leading: Icon(
          Icons.account_circle_rounded,
          color: Colors.blue,
          size: 40.0,
        ),
        title: Text("Priya Mishra"),
        subtitle: Text("Learning flutter"),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete_rounded,
            color: Colors.grey.shade700,
            size: 30.0,
          ),
        ),
        onTap: () {
          debugPrint("tap list tile");
        },
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
