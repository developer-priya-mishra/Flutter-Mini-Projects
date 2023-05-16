import 'package:learn_flutter/36.%20rest_api_2_fruits/models/nutrition.dart';

class Fruit {
  String? genus;
  String? name;
  int? id;
  String? family;
  String? order;
  Nutrition? nutritions;

  Fruit({
    required this.genus,
    required this.name,
    required this.id,
    required this.family,
    required this.order,
    // required this.nutritions,
  });

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      genus: json['genus'],
      name: json['name'],
      id: json['id'],
      family: json['family'],
      order: json['order'],
      // nutritions: Nutrition.fromJson(json['nutritions']),
    );
  }
}
