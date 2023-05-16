import 'package:flutter/material.dart';

class FutureEvents extends StatefulWidget {
  static const String path = "/future-events";
  const FutureEvents({super.key});

  @override
  State<FutureEvents> createState() => _FutureEventsState();
}

class _FutureEventsState extends State<FutureEvents> {
  Future<void> getData() async {
    Future.delayed(Duration(seconds: 3), () {
      debugPrint("User id - 1");
    }).then((value) {
      Future.delayed(Duration(seconds: 2), () {
        debugPrint("Hey its Flutter Developer");
      });
    }).catchError((error) {
      debugPrint(error);
    });

    debugPrint("Random line of code");
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
            getData();
          },
          child: Text("Click here"),
        ),
      ),
    );
  }
}
