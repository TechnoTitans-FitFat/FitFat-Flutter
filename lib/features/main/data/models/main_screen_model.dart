import 'package:fitfat/core/api/end_points.dart';

class MainScreenModel {
  final String image;
  final String name;
  final String price;
  final String calories;

  MainScreenModel({required this.image, required this.name, required this.price, required this.calories});

  factory MainScreenModel.fromJson(Map<String,dynamic> jsonData){
    return MainScreenModel(
      image: jsonData[ApiKey.image],
      name: jsonData[ApiKey.name],
      price: jsonData[ApiKey.price].toString(),
      calories: jsonData[ApiKey.calories].toString()
    );
  }
}