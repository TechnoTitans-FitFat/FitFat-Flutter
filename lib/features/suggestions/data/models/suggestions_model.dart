import 'package:fitfat/core/api/end_points.dart';

class SuggestionsModel {
   final String image;
  final String name;
  final String price;
  final String calories;

  SuggestionsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.calories,
    });

  factory SuggestionsModel.fromJson(Map<String,dynamic> jsonData){
    return SuggestionsModel(
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      price: jsonData[ApiKey.price].toString(),
      calories: jsonData[ApiKey.calories].toString()
    );
  }
}