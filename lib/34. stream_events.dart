import 'dart:async';

import 'package:flutter/material.dart';

class StreamEvents extends StatefulWidget {
  static const String path = "/stream-events";
  const StreamEvents({super.key});

  @override
  State<StreamEvents> createState() => _StreamEventsState();
}

class _StreamEventsState extends State<StreamEvents> {
  final StreamController streamController = StreamController();

  void streamData() async {
    streamController.stream.listen((data) {
      debugPrint(data);
    });

    for (int i = 0; i < 4; i++) {
      streamController.add("You got a message !");
      await Future.delayed(Duration(seconds: 2), () {
        debugPrint("Read - $i");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Events"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            streamData();
          },
          child: Text("Click to open stream"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Text"),
        onPressed: () {
          streamController.add("You have a new notification");
        },
      ),
    );
  }
}
