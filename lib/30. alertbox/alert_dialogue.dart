import 'package:flutter/material.dart';

class FlutterAlertDialog extends StatelessWidget {
  static const String path = "/alert-dialog";
  const FlutterAlertDialog({super.key});

  void _showIt(context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("AlertDialog Widget"),
          content: Text("Creates an alert dialog. Typically used in conjunction with showDialog."),
          actions: [
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
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
