class Nutrition {
  double? carbohydrates;
  double? protein;
  double? fat;
  int? calories;
  double? sugar;

  Nutrition({
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      carbohydrates: json['carbohydrates'],
      protein: json['protein'],
      fat: json['fat'],
      calories: json['calories'],
      sugar: json['sugar'],
    );
  }
}
