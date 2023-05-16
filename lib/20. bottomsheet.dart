import 'package:flutter/material.dart';

class FlutterBottomSheet extends StatelessWidget {
  static const String path = "/bottomsheet";
  const FlutterBottomSheet({super.key});

  void _showIt(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext inContext) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("What's your favorite pet?"),
              SizedBox(height: 15.0),
              ElevatedButton(
                child: Text("Dog"),
                onPressed: () {
                  Navigator.of(inContext).pop();
                },
              ),
              ElevatedButton(
                child: Text("Cat"),
                onPressed: () {
                  Navigator.of(inContext).pop();
                },
              ),
              ElevatedButton(
                child: Text("Ferret"),
                onPressed: () {
                  Navigator.of(inContext).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
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
