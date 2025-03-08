import 'package:fitfat/core/api/end_points.dart';

class SuggestionsModel {
   final String image;
  final String name;
  final double price;
  final String calories;
  final String id;

  SuggestionsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    required this.id,
    });

  factory SuggestionsModel.fromJson(Map<String,dynamic> jsonData){
    final priceValue = jsonData[ApiKey.price];
    return SuggestionsModel(
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
        price: priceValue is num ? priceValue.toDouble() : double.tryParse(priceValue.toString()) ?? 0.0, 
      calories: jsonData[ApiKey.calories].toString(),
      id: jsonData[ApiKey.id].toString(),
    );
  }
}