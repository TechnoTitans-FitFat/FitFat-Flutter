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
    required this.id,
    required this.allergy, 
  });

  final String image;
  final String name;
  final double price;
  final String calories;
  final String protein;
  final String carb;
  final String fiber;
  final String fat;
  final List<String> ingredients;
  final String cookingTime;
  final double rating;
  final String id;
  final List<String> allergy; 

  factory MealDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    // print("Full API Response in Model: $jsonData");
    //print("Raw Ingredients Data: ${jsonData[ApiKey.ingredients]}");
    print("Raw Rating from API: ${jsonData[ApiKey.rating]}");
    final ratingValue = jsonData[ApiKey.rating];
    final priceValue = jsonData[ApiKey.price];
    return MealDetailsModel(
      id: jsonData[ApiKey.id] ?? '',
      image: jsonData[ApiKey.image] ?? '',
      name: jsonData[ApiKey.name] ?? 'Unknown',
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      protein: jsonData[ApiKey.protein]?.toString() ?? '0',
      carb: jsonData[ApiKey.carb]?.toString() ?? '0',
      fat: jsonData[ApiKey.fat]?.toString() ?? '0',
      fiber: jsonData[ApiKey.fiber]?.toString() ?? '0',
      ingredients: (jsonData[ApiKey.ingredients] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      cookingTime: jsonData[ApiKey.cookingTime]?.toString() ?? '0 min',
      rating: ratingValue is num ? ratingValue.toDouble() : 0.0,
      price: priceValue is num ? priceValue.toDouble() : 0.0,
      allergy: (jsonData['allergy'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList() ?? [],
    );
  }
}
