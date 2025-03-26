import 'package:fitfat/core/api/end_points.dart';

class DietModel  {
  final String image;
  final String name;
  final double price;
  final double calories;
  final String id;
  final double cookingTime;
  final List<String> diet;

  final double rating;

  DietModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    required this.cookingTime,
    required this.diet,

    required this.rating,
  });

 factory DietModel.fromJson(Map<String, dynamic> jsonData) {
  final priceValue = jsonData[ApiKey.price];

  return DietModel(
    cookingTime: jsonData[ApiKey.cookingTime]?.toDouble() ?? 0.0,
    image: jsonData[ApiKey.image] ?? '',
    name: jsonData[ApiKey.name] ?? '',
    price: priceValue is num ? priceValue.toDouble() : 0.0,
    calories: (jsonData[ApiKey.calories] as num?)?.toDouble() ?? 0.0, // FIXED
    id: jsonData[ApiKey.id] ?? '',
    diet: jsonData[ApiKey.diet] is List
        ? List<String>.from(jsonData[ApiKey.diet])
        : jsonData[ApiKey.diet] != null
            ? [jsonData[ApiKey.diet].toString()]
            : [],
    rating: (jsonData['rating'] as num?)?.toDouble() ?? 0.0,
  );
}

}
