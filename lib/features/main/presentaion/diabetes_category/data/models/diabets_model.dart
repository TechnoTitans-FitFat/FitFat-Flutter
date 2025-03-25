import 'package:fitfat/core/api/end_points.dart';

class DiabetsModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double cookingTime;


  final double rating;

  DiabetsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    required this.cookingTime,
  

    required this.rating,
  });

  factory DiabetsModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];

    return DiabetsModel(
      cookingTime: jsonData[ApiKey.cookingTime]?.toDouble() ?? 0.0,
      image: jsonData[ApiKey.image] ?? '',
      name: jsonData[ApiKey.name] ?? '',
      price: priceValue is num ? priceValue.toDouble() : 0.0,
      calories: jsonData[ApiKey.calories]?.toString() ?? '0',
      id: jsonData[ApiKey.id] ?? '',
      rating: (jsonData['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
