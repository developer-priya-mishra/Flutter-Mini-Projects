import 'package:flutter/material.dart';

class FlutterSimpleDialog extends StatelessWidget {
  static const String path = "/simple-dialog";
  const FlutterSimpleDialog({super.key});

  void _showIt(context) async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext inContext) {
        return SimpleDialog(
          title: Text("What's your favorite food?"),
          children: [
            SimpleDialogOption(
              child: Text("Brocolli"),
              onPressed: () {
                Navigator.pop(inContext, "brocolli");
              },
            ),
            SimpleDialogOption(
              child: Text("Steak"),
              onPressed: () {
                Navigator.pop(inContext, "steak");
              },
            )
          ],
        );
      },
    )) {
      case "brocolli":
        debugPrint("Brocolli");
        break;
      case "steak":
        debugPrint("Steak");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Dialog"),
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
