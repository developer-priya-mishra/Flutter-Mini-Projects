import 'package:flutter/material.dart';

class NameList extends StatefulWidget {
  static const String path = "/name-list";
  final String username;
  const NameList({super.key, this.username = 'Jeff Bezoz'});

  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  List<String> names = ['Elon', 'Bill', 'Mark'];
  int i = 0;
  Color color = Colors.red;

  late String name;

  @override
  void initState() {
    super.initState();
    debugPrint("init state");
    name = widget.username;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("did change dependencies");
  }

  @override
  void didUpdateWidget(covariant NameList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.username != oldWidget.username) {
      debugPrint("did update widget");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build function");
    return Scaffold(
      appBar: AppBar(
        title: Text("Name List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My name is ${names[i]}'),
            ElevatedButton(
              onPressed: () {
                if (i < names.length - 1) {
                  setState(() {
                    i++;
                  });
                }
              },
              child: Text("Next"),
            ),
            ElevatedButton(
              onPressed: () {
                if (i > 0) {
                  setState(() {
                    i--;
                  });
                }
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color = Colors.red == color ? Colors.blue : Colors.red;
          });
        },
        backgroundColor: color,
        child: Icon(Icons.color_lens_rounded),
      ),
    );
  }
}
