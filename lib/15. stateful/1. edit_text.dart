import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  static const String path = "/edit-text";
  const EditText({super.key});

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  String name = 'Priya';
  @override
  Widget build(BuildContext context) {
    debugPrint("Widget is rendering");
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Text"),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              setState(() {
                name = value;
              });
              debugPrint("SetState is called");
            },
          ),
          Text('Hello $name'),
        ],
      ),
    );
  }
}
