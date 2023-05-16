import 'package:flutter/material.dart';

class FlutterTextField2 extends StatefulWidget {
  static const String path = "/flutter-custom-textField";
  const FlutterTextField2({super.key});
  @override
  State<FlutterTextField2> createState() => _FlutterTextField2State();
}

class _FlutterTextField2State extends State<FlutterTextField2> {
  late String name;
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handle User Input'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameController.text,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Print"))
          ],
        ),
      ),
    );
  }
}
