import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/36.%20rest_api_2_fruits/models/fruit.dart';

class ApiService {
  Future getAllFruits() async {
    final allFruitsUrl = Uri.parse("https://fruityvice.com/api/fruit/all");
    final response = await http.get(allFruitsUrl);
    List<Fruit> allFruits = [];
    List body = json.decode(response.body);
    for (var item in body) {
      allFruits.add(Fruit.fromJson(item));
    }
    return allFruits;
  }

  Future getSingleFruit(int id) async {
    final singleFruitUrl = Uri.parse("https://fruityvice.com/api/fruit/$id");
    final response = await http.get(singleFruitUrl);
    var body = json.decode(response.body);
    return Fruit.fromJson(body);
  }
}
