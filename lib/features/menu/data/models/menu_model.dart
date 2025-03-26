import 'package:fitfat/core/api/end_points.dart';

class MenuModel {
  final String image;
  final String name;
  final double price;
  final String calories;
  final String id;

  MenuModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
  });

    factory MenuModel.fromJson(Map<String, dynamic> jsonData) {
    final priceValue = jsonData[ApiKey.price];
    return MenuModel(
        image: jsonData[ApiKey.image],
        name: jsonData[ApiKey.name],
        price: priceValue is num ? priceValue.toDouble() : 0.0,
        calories: jsonData[ApiKey.calories].toString(),
        id : jsonData[ApiKey.id]   
        );

  }
}
