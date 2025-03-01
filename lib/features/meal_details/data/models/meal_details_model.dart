import 'package:fitfat/core/api/end_points.dart';

class MealDetailsModel {
  MealDetailsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.protein,
    required this.carb,
    required this.fiber,
    required this.fat,
    required this.ingredients,
    required this.cookingTime,
    required this.rating,
  });

  final String image;
  final String name;
  final String price;
  final String calories;
  final String protein;
  final String carb;
  final String fiber;
  final String fat;
  final List<String> ingredients;
  final String cookingTime;
  final double rating;

  factory MealDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MealDetailsModel(
      image: jsonData[ApiKey.image] ?? '',
      name: jsonData[ApiKey.name] ?? 'Unknown',
      price: jsonData[ApiKey.price]?.toString() ?? '0',
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      protein: jsonData[ApiKey.protein]?.toString() ?? '0',
      carb: jsonData[ApiKey.carb]?.toString() ?? '0',
      fat: jsonData[ApiKey.fat]?.toString() ?? '0',
      fiber: jsonData[ApiKey.fiber]?.toString() ?? '0',
      // ignore: collection_methods_unrelated_type
      ingredients: (jsonData[ApiKey.ingredients] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      cookingTime: jsonData[ApiKey.cookingTime]?.toString() ?? '0 min',
      // ignore: collection_methods_unrelated_type
      rating: (jsonData[ApiKey.rating] as num?)?.toDouble() ?? 0.0,
    );
  }
}
