import 'package:flutter/material.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/models/fruit.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/services/api_service.dart';

class FruitDetail extends StatelessWidget {
  final int id;
  const FruitDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getSingleFruit(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Fruit fruit = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        "${fruit.name}",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(height: 10.0),
                    SizedBox(height: 10.0),
                    Text(
                      "Family: ${fruit.family}",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Genus: ${fruit.genus}",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Order: ${fruit.order}",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Text(
                    //   "Carbohydrates: ${fruit.nutritions?.carbohydrates}",
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
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
