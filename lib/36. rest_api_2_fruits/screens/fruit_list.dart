import 'package:flutter/material.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/models/fruit.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/screens/fruit_detail.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/services/api_service.dart';

class FruitList extends StatefulWidget {
  static const String path = "/fruit-list";
  const FruitList({super.key});

  @override
  State<FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit List"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getAllFruits(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Fruit fruit = snapshot.data[index];
                return ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(fruit.name == null ? "-" : fruit.name!),
                  subtitle: Text("Family - ${fruit.family}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FruitDetail(id: fruit.id ?? -1),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
