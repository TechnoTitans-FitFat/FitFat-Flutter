import 'package:fitfat/core/api/end_points.dart';

class AllergyModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double cookingTime;

  AllergyModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.calories,
      required this.id,
      required this.cookingTime, });

  factory AllergyModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];
    return AllergyModel(
      cookingTime:jsonData[ApiKey.cookingTime],
        image: jsonData[ApiKey.image],
        name: jsonData[ApiKey.name],
        price: priceValue is num ? priceValue.toDouble() : 0.0,
        calories: jsonData[ApiKey.calories].toString(),
        id: jsonData[ApiKey.id],
        );
  }
}
