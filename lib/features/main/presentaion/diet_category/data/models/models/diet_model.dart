import 'package:fitfat/core/api/end_points.dart';

class DietModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;
  final double cookingTime;

  DietModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.calories,
      required this.id,
      required this.cookingTime, });

  factory DietModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];
    return DietModel(
      cookingTime:jsonData[ApiKey.cookingTime],
        image: jsonData[ApiKey.image],
        name: jsonData[ApiKey.name],
        price: priceValue is num ? priceValue.toDouble() : 0.0,
        calories: jsonData[ApiKey.calories].toString(),
        id: jsonData[ApiKey.id],
        );
  }
}
