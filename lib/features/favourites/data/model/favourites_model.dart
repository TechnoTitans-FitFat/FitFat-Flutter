import 'package:fitfat/core/api/end_points.dart';

class FavouritesModel {
   final String id;
  final String image;
  final String name;
  final String calories;
  final String rating;
  final String price;

  FavouritesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.calories,
    required this.rating,
    required this.price,
  });
  factory FavouritesModel.fromJson(Map<String,dynamic> jsonData){
    return FavouritesModel(
      id: jsonData[ApiKey.id]?? '' ,
      image: jsonData[ApiKey.image]?? '',
      name: jsonData[ApiKey.name]?? '',
      calories: jsonData[ApiKey.calories]?? '',
      rating: jsonData[ApiKey.rating]?? '',
      price: jsonData[ApiKey.price]?? '', 
    );
  }
}
