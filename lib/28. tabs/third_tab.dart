import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.airport_shuttle,
            size: 160.0,
            color: Colors.blue,
          ),
          Text("Third Tab")
        ],
      ),
    );
  }
}
