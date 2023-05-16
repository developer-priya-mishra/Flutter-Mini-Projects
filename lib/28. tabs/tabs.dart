import 'package:flutter/material.dart';
import 'first_tab.dart';
import 'second_tab.dart';
import 'third_tab.dart';

class FlutterTabs extends StatefulWidget {
  static const String path = "/tabs";
  const FlutterTabs({super.key});

  @override
  FlutterTabsState createState() => FlutterTabsState();
}

class FlutterTabsState extends State<FlutterTabs> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabs"),
        backgroundColor: Colors.blue,
        bottom: TabBar(
          tabs: const <Tab>[
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.adb)),
            Tab(icon: Icon(Icons.airport_shuttle)),
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          FirstTab(),
          SecondTab(),
          ThirdTab(),
        ],
      ),
    );
  }
}
