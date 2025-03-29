import 'package:fitfat/core/api/end_points.dart';

class AllergyModel {
  final String image;
  final String name;
  final double price;
  final double calories;
  final String id;
  final double cookingTime;
  final List<String> allergy;
  final double rating;

  AllergyModel( 
      {required this.image,
      required this.name,
      required this.price,
      required this.calories,
      required this.id,
      required this.cookingTime,
      required this.allergy,
      required this.rating});

  factory AllergyModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];
    return AllergyModel(
      allergy: jsonData[ApiKey.allergy] is List
          ? List<String>.from(jsonData[ApiKey.allergy])
          : jsonData[ApiKey.allergy] != null
              ? [jsonData[ApiKey.allergy].toString()]
              : [],
      cookingTime: jsonData[ApiKey.cookingTime],
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      price: priceValue is num ? priceValue.toDouble() : 0.0,
      calories: jsonData[ApiKey.calories],
      id: jsonData[ApiKey.id],
       rating: (jsonData['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
