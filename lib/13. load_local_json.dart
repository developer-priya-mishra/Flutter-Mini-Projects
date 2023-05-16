import 'dart:convert';
import 'package:flutter/material.dart';

class LoadLocalJson extends StatefulWidget {
  static const String path = "/load-local-json";
  const LoadLocalJson({super.key});

  @override
  LoadLocalJsonState createState() => LoadLocalJsonState();
}

class LoadLocalJsonState extends State<LoadLocalJson> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load local JSON file"),
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('data_repo/json_data.json'),
          builder: (context, snapshot) {
            var newData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: ${newData[index]['name']}"),
                        Text("Height: ${newData[index]['height']}"),
                        Text("Mass: ${newData[index]['mass']}"),
                        Text("Hair Color: ${newData[index]['hair_color']}"),
                        Text("Skin Color: ${newData[index]['skin_color']}"),
                        Text("Eye Color: ${newData[index]['eye_color']}"),
                        Text("Birth Year: ${newData[index]['birth_year']}"),
                        Text("Gender: ${newData[index]['gender']}")
                      ],
                    ),
                  ),
                );
              },
              itemCount: newData == null ? 0 : newData.length,
            );
          },
        ),
      ),
    );
  }
}
